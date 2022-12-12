//
//  APIManaging.swift
//  DemoApp
//
//  Created by Kid Kid on 12/8/22.
//

protocol APIManaging {
    func perform<T: Decodable>(of type: T.Type,
                               requestBuilder: RequestBuilding,
                               responseParser: ResponseParsing)
}
