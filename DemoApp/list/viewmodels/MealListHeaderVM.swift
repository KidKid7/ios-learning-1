//
//  MealListHeaderVM.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

import Foundation

struct MealListHeaderVM {
    let title: String
}

extension MealListHeaderVM: MealListHeaderManaging {
    var sectionTitle: String {
        return title
    }
}
