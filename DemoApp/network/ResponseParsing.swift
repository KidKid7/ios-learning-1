//
//  ResponseParsing.swift
//  DemoApp
//
//  Created by Kid Kid on 12/5/22.
//

protocol ResponseParsing {
    func handleSuccess<T: Decodable>(_ data: T)
    func handleError(_ error: Error)
}
