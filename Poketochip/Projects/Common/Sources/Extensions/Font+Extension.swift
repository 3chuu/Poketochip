//
//  Font+Extension.swift
//  Common
//
//  Created by 윤지호 on 1/25/24.
//

import UIKit

extension UIFont {
    public enum FontStyle {
        case bold, light, regular
        
        var font: CommonFontConvertible {
            switch self {
            case .bold:
                return CommonFontFamily.GmarketSans.bold
            case .light:
                return CommonFontFamily.GmarketSans.light
            case .regular:
                return CommonFontFamily.GmarketSans.medium
            }
        }
    }
    public enum FontType {
        /// size 22
        case headline01
        /// size 20
        case headline02
        /// size 18
        case body01
        /// size 16
        case body02
        /// size 14
        case body03
        /// size 12
        case caption01
        /// size 10
        case caption02
        
        var size: CGFloat {
            switch self {
            case .headline01:
                return 22
            case .headline02:
                return 20
            case .body01:
                return 18
            case .body02:
                return 16
            case .body03:
                return 14
            case .caption01:
                return 12
            case .caption02:
                return 10
            }
        }
    }
    
    public static func customFont(_ style: FontStyle, type: FontType) -> UIFont {
        return style.font.font(size: type.size)
    }
}
