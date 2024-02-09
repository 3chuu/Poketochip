//
//  UIView+Extension.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import UIKit
import RxSwift
import RxCocoa

extension UIView {
    public func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
    public func getTapControlEvent() -> ControlEvent<UITapGestureRecognizer> {
        let tabGesture = UITapGestureRecognizer()
        self.addGestureRecognizer(tabGesture)
        return tabGesture.rx.event
    }
}
