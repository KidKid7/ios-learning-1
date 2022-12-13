//
//  UIView+Animation.swift
//  DemoApp
//
//  Created by Kid Kid on 12/11/22.
//

import UIKit

extension UIView {
    func highlighted(_ isHighlighted: Bool, scaleRate: CGFloat = 0.97, duration: Double = 0.2) {
      let transform = isHighlighted ? CGAffineTransform(scaleX: scaleRate, y: scaleRate) : .identity
      let delay = isHighlighted ? 0 : duration
      UIView.animate(withDuration: duration,
                     delay: delay,
                     options: .curveEaseInOut,
                     animations: {
        self.transform = transform
      })
    }
}
