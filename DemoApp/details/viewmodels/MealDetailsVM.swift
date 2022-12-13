//
//  MealDetailsVM.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import Foundation
import Combine

protocol MealDetailsManaging {
    var numberOfSections: Int { get }
    var headerVM: HeaderRowManaging { get }
    var instructionVM: InstructionRowManaging { get }
    var foodstuffVM: FoodstuffRowManaging { get }
    func transform(input: AnyPublisher<MealDetailsVM.Input, Never>) -> AnyPublisher<MealDetailsVM.Output, Never>
}

class MealDetailsVM {    
    enum Input {
        case viewDidLoad
    }
    
    enum Output {
        case loadDetailsDidSucceed
        case loadDetailsDidFail(error: Error)
    }
    
    private var mealDetail: MealDetails!
    private var apiService: MealDetailsServing!
    
    private var output: PassthroughSubject<Output, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    init(apiService: MealDetailsServing, meal: Meal) {
        self.apiService = apiService
        self.mealDetail = MealDetails(from: meal)
    }
}

extension MealDetailsVM: MealDetailsManaging {
    var numberOfSections: Int {
        return 3
    }
    
    var headerVM: HeaderRowManaging {
        return DetailsRowVM(mealDetails: mealDetail)
    }
    
    var instructionVM: InstructionRowManaging {
        return DetailsRowVM(mealDetails: mealDetail)
    }
    
    var foodstuffVM: FoodstuffRowManaging {
        return DetailsRowVM(mealDetails: mealDetail)
    }
    
    func transform(input: AnyPublisher<MealDetailsVM.Input, Never>) -> AnyPublisher<MealDetailsVM.Output, Never> {
        input.sink { [weak self] event in
            switch event {
            case .viewDidLoad:
                self?.loadDetails()
            }
        }.store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
}

private extension MealDetailsVM {
    func loadDetails() {
        Task {
            do {
                mealDetail = try await apiService.loadMealDetails(mealId: mealDetail.id)
                output.send(.loadDetailsDidSucceed)
            } catch {
                output.send(.loadDetailsDidFail(error: error))
            }
        }
    }
}
