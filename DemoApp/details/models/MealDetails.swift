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
    let foodstuffs: [Foodstuff]
    
    init(from meal: Meal) {
        id = meal.id
        name = meal.name
        imageUrlStr = meal.imageUrlStr
        instruction = ""
        category = ""
        foodstuffs = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = container.decodeString(forKey: .name)
        imageUrlStr = container.decodeString(forKey: .imageUrlStr)
        instruction = container.decodeString(forKey: .instruction)
        category = container.decodeString(forKey: .category)
        
        let ingredient1 = container.decodeString(forKey: .strIngredient1)
        let measurement1 = container.decodeString(forKey: .strMeasure1)
        let fs1 = Foodstuff(ingredient: ingredient1, measurement: measurement1)
        
        let ingredient2 = container.decodeString(forKey: .strIngredient2)
        let measurement2 = container.decodeString(forKey: .strMeasure2)
        let fs2 = Foodstuff(ingredient: ingredient2, measurement: measurement2)
        
        let ingredient3 = container.decodeString(forKey: .strIngredient3)
        let measurement3 = container.decodeString(forKey: .strMeasure3)
        let fs3 = Foodstuff(ingredient: ingredient3, measurement: measurement3)
        
        let ingredient4 = container.decodeString(forKey: .strIngredient4)
        let measurement4 = container.decodeString(forKey: .strMeasure4)
        let fs4 = Foodstuff(ingredient: ingredient4, measurement: measurement4)
        
        let ingredient5 = container.decodeString(forKey: .strIngredient5)
        let measurement5 = container.decodeString(forKey: .strMeasure5)
        let fs5 = Foodstuff(ingredient: ingredient5, measurement: measurement5)
        
        let ingredient6 = container.decodeString(forKey: .strIngredient6)
        let measurement6 = container.decodeString(forKey: .strMeasure6)
        let fs6 = Foodstuff(ingredient: ingredient6, measurement: measurement6)
        
        let ingredient7 = container.decodeString(forKey: .strIngredient7)
        let measurement7 = container.decodeString(forKey: .strMeasure7)
        let fs7 = Foodstuff(ingredient: ingredient7, measurement: measurement7)
        
        let ingredient8 = container.decodeString(forKey: .strIngredient8)
        let measurement8 = container.decodeString(forKey: .strMeasure8)
        let fs8 = Foodstuff(ingredient: ingredient8, measurement: measurement8)
        
        let ingredient9 = container.decodeString(forKey: .strIngredient9)
        let measurement9 = container.decodeString(forKey: .strMeasure9)
        let fs9 = Foodstuff(ingredient: ingredient9, measurement: measurement9)
        
        let ingredient10 = container.decodeString(forKey: .strIngredient10)
        let measurement10 = container.decodeString(forKey: .strMeasure10)
        let fs10 = Foodstuff(ingredient: ingredient10, measurement: measurement10)
        
        let ingredient11 = container.decodeString(forKey: .strIngredient11)
        let measurement11 = container.decodeString(forKey: .strMeasure11)
        let fs11 = Foodstuff(ingredient: ingredient11, measurement: measurement11)
        
        let ingredient12 = container.decodeString(forKey: .strIngredient12)
        let measurement12 = container.decodeString(forKey: .strMeasure12)
        let fs12 = Foodstuff(ingredient: ingredient12, measurement: measurement12)
        
        let ingredient13 = container.decodeString(forKey: .strIngredient13)
        let measurement13 = container.decodeString(forKey: .strMeasure13)
        let fs13 = Foodstuff(ingredient: ingredient13, measurement: measurement13)
        
        let ingredient14 = container.decodeString(forKey: .strIngredient14)
        let measurement14 = container.decodeString(forKey: .strMeasure14)
        let fs14 = Foodstuff(ingredient: ingredient14, measurement: measurement14)
        
        let ingredient15 = container.decodeString(forKey: .strIngredient15)
        let measurement15 = container.decodeString(forKey: .strMeasure15)
        let fs15 = Foodstuff(ingredient: ingredient15, measurement: measurement15)
        
        let ingredient16 = container.decodeString(forKey: .strIngredient16)
        let measurement16 = container.decodeString(forKey: .strMeasure16)
        let fs16 = Foodstuff(ingredient: ingredient16, measurement: measurement16)
        
        let ingredient17 = container.decodeString(forKey: .strIngredient17)
        let measurement17 = container.decodeString(forKey: .strMeasure17)
        let fs17 = Foodstuff(ingredient: ingredient17, measurement: measurement17)
        
        let ingredient18 = container.decodeString(forKey: .strIngredient18)
        let measurement18 = container.decodeString(forKey: .strMeasure18)
        let fs18 = Foodstuff(ingredient: ingredient18, measurement: measurement18)
        
        let ingredient19 = container.decodeString(forKey: .strIngredient19)
        let measurement19 = container.decodeString(forKey: .strMeasure19)
        let fs19 = Foodstuff(ingredient: ingredient19, measurement: measurement19)
        
        let ingredient20 = container.decodeString(forKey: .strIngredient20)
        let measurement20 = container.decodeString(forKey: .strMeasure20)
        let fs20 = Foodstuff(ingredient: ingredient20, measurement: measurement20)
        
        foodstuffs = [fs1, fs2, fs3, fs4, fs5, fs6, fs7, fs8, fs9, fs10,
                      fs11, fs12, fs13, fs14, fs15, fs16, fs17, fs18, fs19, fs20]
    }
    
    enum CodingKeys: String, CodingKey {
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
             strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
}
