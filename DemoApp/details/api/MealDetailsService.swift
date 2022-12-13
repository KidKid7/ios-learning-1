//
//  MealDetailsService.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

protocol MealDetailsServing {
    func loadMealDetails(mealId: String) async throws -> MealDetails
}

struct MealDetailsService {
    let apiManager: APIManaging
    
    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
}

extension MealDetailsService: MealDetailsServing {
    func loadMealDetails(mealId: String) async throws -> MealDetails {
        try await withCheckedThrowingContinuation { continuation in
            let req = MealDetailsRequestBuilder(mealId: mealId)
            let res = MealDetailsResponseParser(continuation: continuation)
            apiManager.perform(of: MealDetailsResponse.self, requestBuilder: req, responseParser: res)
        }
    }
}
