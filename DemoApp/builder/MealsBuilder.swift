//
//  MealsBuilder.swift
//  DemoApp
//
//  Created by Kid Kid on 12/8/22.
//

class MealsBuilder {
    func buildMealListVC() -> MealListVC {
        let apiManager = APIManager()
        let apiService = MealListService(apiManager: apiManager)
        let vm = MealListVM(apiService: apiService)
        return MealListVC(vm: vm)
    }
    
    //func buildMealDetailsVC() -> MealDe
}
