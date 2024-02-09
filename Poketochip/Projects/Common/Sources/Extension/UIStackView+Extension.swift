//
//  UIStackView+Extension.swift
//  Common
//
//  Created by cha_nyeong on 2/9/24.
//

import UIKit

extension UIStackView {
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
