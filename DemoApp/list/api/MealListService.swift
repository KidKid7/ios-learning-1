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
    
    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
}

extension MealListService: MealListServing {
    func loadMeals() async throws -> [Meal] {
        try await withCheckedThrowingContinuation { continuation in
            let req = MealListRequestBuilder()
            let res = MealListResponseParser(continuation: continuation)
            apiManager.perform(of: MealsResponse.self, requestBuilder: req, responseParser: res)
        }
    }
}
