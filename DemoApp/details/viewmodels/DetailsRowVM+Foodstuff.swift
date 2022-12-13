//
//  FoodstuffRowVM.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

protocol FoodstuffRowManaging {
    var numberOfRows: Int { get }
    func foodstuff(for row: Int) -> Foodstuff
}

extension DetailsRowVM: FoodstuffRowManaging {
    private var foodstuffs: [Foodstuff] {
        return mealDetails.foodstuffs.filter { !$0.ingredient.isEmpty }
    }
    
    var numberOfRows: Int {
        return foodstuffs.count
    }
    
    func foodstuff(for row: Int) -> Foodstuff {
        return foodstuffs[row]
    }
}
