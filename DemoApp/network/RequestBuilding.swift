//
//  RequestBuilding.swift
//  DemoApp
//
//  Created by Kid Kid on 12/5/22.
//

import Foundation

enum RequestMethod {
    case get
    case post
}

enum RequestEncoding {
    case url
    case json
}

protocol RequestBuilding {
    var path: String { get }
    var apiVersion: String { get }
    
    var method: RequestMethod { get }
    var encoding: RequestEncoding { get }
    var headers: [String: String] { get }
    var parameters: [String: AnyObject]? { get }
}
