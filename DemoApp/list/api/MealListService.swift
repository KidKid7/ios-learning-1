//
//  MealListService.swift
//  DemoApp
//
//  Created by Kid Kid on 12/7/22.
//

protocol MealListServing {
    func loadMeals() async throws -> [Meal]
}

struct MealListService {
    let apiManager: APIManaging
    let category: String
    
    init(apiManager: APIManaging, category: String) {
        self.apiManager = apiManager
        self.category = category
    }
}

extension MealListService: MealListServing {
    func loadMeals() async throws -> [Meal] {
        try await withCheckedThrowingContinuation { continuation in
            let req = MealListRequestBuilder(category: category)
            let res = MealListResponseParser(continuation: continuation)
            apiManager.perform(of: MealsResponse.self, requestBuilder: req, responseParser: res)
        }
    }
}
