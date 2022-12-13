//
//  MealDetailsResponseParser.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]
}

struct MealDetailsResponseParser {
    private let continuation: CheckedContinuation<MealDetails, Error>
    
    init(continuation: CheckedContinuation<MealDetails, Error>) {
        self.continuation = continuation
    }
}

extension MealDetailsResponseParser: ResponseParsing {
    func handleSuccess<T>(_ data: T) where T : Decodable {
        guard let res = data as? MealDetailsResponse,
                let mealDetails = res.meals.first else { return }
        continuation.resume(returning: mealDetails)
    }
    
    func handleError(_ error: Error) {
        continuation.resume(throwing: error)
    }
}
