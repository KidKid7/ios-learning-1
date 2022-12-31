//
//  MealDetails.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

struct MealDetails: Decodable {
    let id: String
    let name: String
    let imageUrlStr: String
    let instruction: String
    let category: String
    var foodstuffs: [Foodstuff] = []
    
    init(from meal: Meal) {
        id = meal.id
        name = meal.name
        imageUrlStr = meal.imageUrlStr
        instruction = ""
        category = ""
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = container.decodeString(forKey: .name)
        imageUrlStr = container.decodeString(forKey: .imageUrlStr)
        instruction = container.decodeString(forKey: .instruction)
        category = container.decodeString(forKey: .category)
        
        let ingredientKeys = CodingKeys.allCases.filter { $0.stringValue.starts (with: "strIngredient") }
        let measurementKeys = CodingKeys.allCases.filter { $0.stringValue.starts (with: "strMeasure") }
        for (ingredientKey, measurementKey) in zip(ingredientKeys, measurementKeys) {
            let ingredient = container.decodeString(forKey: ingredientKey)
            let measurement = container.decodeString(forKey: measurementKey)
            let foodstuff = Foodstuff(ingredient: ingredient, measurement: measurement)
            foodstuffs.append( foodstuff)
        }
    }
        
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrlStr = "strMealThumb"
        case instruction = "strInstructions"
        case category = "strCategory"
        
        // Ingredients
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
             strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
             strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
             strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        
        // Measurements
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
             strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
             strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15,
             strMeasure16, strMeasure17, strMeasure18, strMeasure19
    }
}
