//
//  UIView+Extension.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
