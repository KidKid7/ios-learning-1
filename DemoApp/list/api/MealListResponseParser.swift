//
//  MealListResponseParser.swift
//  DemoApp
//
//  Created by Kid Kid on 12/7/22.
//

import Foundation

struct MealsResponse: Decodable {
    let meals: [Meal]
}

struct MealListResponseParser {
    private let continuation: CheckedContinuation<[Meal], Error>
    
    init(continuation: CheckedContinuation<[Meal], Error>) {
        self.continuation = continuation
    }
}

extension MealListResponseParser: ResponseParsing {
    func handleSuccess<T>(_ data: T) where T : Decodable {
        guard let res = data as? MealsResponse else { return }
        continuation.resume(returning: res.meals)
    }
    
    func handleError(_ error: Error) {
        continuation.resume(throwing: error)
    }
}
