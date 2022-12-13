//
//  MealDetailsRequestBuilder.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

struct MealDetailsRequestBuilder {
    let mealId: String
}

extension MealDetailsRequestBuilder: DecodableRequestBuilding {
    var path: String {
        return "lookup.php"
    }
    
    var apiVersion: String {
        return "json/v1/1/"
    }
    
    var parameters: [String: AnyObject]? {
        return ["i": mealId] as [String: AnyObject]
    }
    
    var encoding: RequestEncoding {
        return .url
    }
    
    var method: RequestMethod {
        return .get
    }
}
