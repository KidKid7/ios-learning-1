//
//  UIVIew+ViewReuseIdentifiable.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import UIKit

protocol ViewReuseIdentifiable {
    static var reuseIdentifier: String { get }
    static func nib() -> UINib
}

extension UIView: ViewReuseIdentifiable {
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
