//
//  MealListVMTests.swift
//  DemoAppTests
//
//  Created by Kid Kid on 12/23/22.
//

import XCTest
import Combine
@testable import DemoApp

final class MealListVMTests: XCTestCase {
    
    func testSucceedMealList() {
        let mockService = MockSuccessMealListService()
        let viewModel = MealListVM(apiService: mockService)
        
        let input: PassthroughSubject<MealListVM.Input, Never> = .init()
        _ = viewModel.transform(input: input.eraseToAnyPublisher())
        input.send(.viewDidLoad)
        
        let expectation = XCTestExpectation(description: "Load meals asynchronously.")
        expectation.fulfill()
        wait(for: [expectation], timeout: 3.0)
        
        XCTAssertNotEqual(viewModel.sectionTitles, ["K", "A"])
        XCTAssertEqual(viewModel.sectionTitles, ["A", "K"])
        XCTAssertEqual(viewModel.meals(inSection: 0).first?.id, "02")
        XCTAssertEqual(viewModel.meals(inSection: 1).count, 1)
    }
    
    
    func testFailMealList() {
        let mockService = MockFailMealListService()
        let viewModel = MealListVM(apiService: mockService)
        
        let input: PassthroughSubject<MealListVM.Input, Never> = .init()
        _ = viewModel.transform(input: input.eraseToAnyPublisher())
        input.send(.refresh)
        
        let expectation = XCTestExpectation(description: "Load meals asynchronously.")
        expectation.fulfill()
        wait(for: [expectation], timeout: 3.0)
        XCTAssertEqual(viewModel.sectionTitles.count, 0)
    }
    
    private class MockSuccessMealListService: MealListServing {
        func loadMeals() async throws -> [DemoApp.Meal] {
            return [Meal(id: "01", name: "KK", imageUrlStr: "kk01"),
                    Meal(id: "02", name: "AA1", imageUrlStr: "aa02"),
                    Meal(id: "03", name: "AA2", imageUrlStr: "aa03")]
        }
    }
    
    private class MockFailMealListService: MealListServing {
        func loadMeals() async throws -> [DemoApp.Meal] {
            throw APIError.unhandled
        }
    }
}
