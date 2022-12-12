//
//  MealListRequestBuilder.swift
//  DemoApp
//
//  Created by Kid Kid on 12/7/22.
//

struct MealListRequestBuilder { }

extension MealListRequestBuilder: DecodableRequestBuilding {
    var path: String {
        return "filter.php?c=Dessert"
    }
    
    var apiVersion: String {
        return "json/v1/1/"
    }
    
    var method: RequestMethod {
        return .get
    }
}
