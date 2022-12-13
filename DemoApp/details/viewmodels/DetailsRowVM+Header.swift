//
//  DetailsRowVM+Header.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import Foundation

protocol HeaderRowManaging {
    var imageURL: URL? { get }
    var name: String { get }
}

extension DetailsRowVM: HeaderRowManaging {
    var imageURL: URL? {
        return URL(string: mealDetails.imageUrlStr)
    }
    
    var name: String {
        return mealDetails.name
    }
}
