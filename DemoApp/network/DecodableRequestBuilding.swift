//
//  DecodableRequestBuilding.swift
//  DemoApp
//
//  Created by Kid Kid on 12/8/22.
//

protocol DecodableRequestBuilding: RequestBuilding { }

extension DecodableRequestBuilding {
    var headers: [String: String] {
        return [:]
    }
    
    var parameters: [String : AnyObject]? {
        return nil
    }
    
    var encoding: RequestEncoding {
        return .json
    }
}
