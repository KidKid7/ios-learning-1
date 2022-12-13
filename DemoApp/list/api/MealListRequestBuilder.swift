//
//  MealListRequestBuilder.swift
//  DemoApp
//
//  Created by Kid Kid on 12/7/22.
//

struct MealListRequestBuilder {
    let category: String
}

extension MealListRequestBuilder: DecodableRequestBuilding {
    var path: String {
        return "filter.php"
    }
    
    var apiVersion: String {
        return "json/v1/1/"
    }
    
    var parameters: [String : AnyObject]? {
        return ["c": category] as? [String: AnyObject]
    }
    
    var encoding: RequestEncoding {
        return .url
    }
    
    var method: RequestMethod {
        return .get
    }
}
