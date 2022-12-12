//
//  Meal.swift
//  DemoApp
//
//  Created by Kid Kid on 12/8/22.
//

struct Meal: Decodable {
    let id: String
    let name: String
    let imageUrlStr: String

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrlStr = "strMealThumb"
    }
}
