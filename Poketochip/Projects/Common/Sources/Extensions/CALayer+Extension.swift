//
//  CALayer+Extension.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import UIKit

extension CALayer {
    public func addBottomDivider() {
        let height: CGFloat = 10
        let border = CALayer()
        
        border.frame = CGRect.init(x: 0, y: frame.height - height, width: frame.width, height: height)
        
        border.backgroundColor = UIColor.gray.cgColor
        self.addSublayer(border)
    }
}
