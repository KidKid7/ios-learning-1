//
//  UIViewController+Tools.swift
//  DemoApp
//
//  Created by Kid Kid on 12/8/22.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return "\(self)"
    }
    
    var topSafeAreaHeight: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
    
    var bottomSafeAreaHeight: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.bottom ?? 0
    }
}


