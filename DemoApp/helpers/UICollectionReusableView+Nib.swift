//
//  UICollectionReusableView+Nib.swift
//  DemoApp
//
//  Created by Kid Kid on 12/10/22.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
    class func nib() -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
