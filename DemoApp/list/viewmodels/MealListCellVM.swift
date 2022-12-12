//
//  MealListCellVM.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

import Foundation

struct MealListCellVM {
    let meal: Meal
}

extension MealListCellVM: MealListCellManaging {
    var name: String {
        return meal.name
    }
    
    var imageURL: URL? {
        return  URL(string: meal.imageUrlStr)
    }
}

