//
//  MealListVM.swift
//  DemoApp
//
//  Created by Kid Kid on 12/4/22.
//

import Combine

protocol MealListManaging {
    var sectionTitles: [String] { get }
    func meals(inSection section: Int) -> [Meal]
    
    func transform(input: AnyPublisher<MealListVM.Input, Never>) -> AnyPublisher<MealListVM.Output, Never>
}

class MealListVM {
    enum Input {
        case viewDidLoad
        case refresh
    }
    
    enum Output {
        case loadMealsDidSucceed
        case loadMealsDidFail(error: Error)
    }
    
    private var meals: [Meal] = []
    private let apiService: MealListServing
    private var output: PassthroughSubject<Output, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    init(apiService: MealListServing) {
        self.apiService = apiService
    }
}

extension MealListVM: MealListManaging {
    var sectionTitles: [String] {
        return groupedMeals.keys.sorted()
    }

    func meals(inSection section: Int) -> [Meal] {
        let key = sectionTitles[section]
        return groupedMeals[key] ?? []
    }
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input.sink { [weak self] event in
            switch event {
            case .viewDidLoad, .refresh:
                self?.loadMeals()
            }
        }.store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
}

private extension MealListVM {
    var groupedMeals: [String: [Meal]] {
        return Dictionary(grouping: meals) {
            guard let alphabet = $0.name.first else { return "" }
            return "\(alphabet)"
        }
    }
    
    func loadMeals() {
        Task {
            do {
                meals = try await apiService.loadMeals()
                output.send(.loadMealsDidSucceed)
            } catch {
                output.send(.loadMealsDidFail(error: error))
            }
        }
    }
}

