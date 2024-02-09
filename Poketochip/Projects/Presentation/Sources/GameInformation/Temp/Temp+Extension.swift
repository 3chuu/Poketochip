//
//  Temp+Extension.swift
//  Presentation
//
//  Created by cha_nyeong on 1/24/24.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

extension UIStackView {
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
