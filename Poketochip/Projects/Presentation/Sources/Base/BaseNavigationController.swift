//
//  BaseNavigaionController.swift
//  Presentation
//
//  Created by 윤지호 on 6/14/24.
//

import Foundation
import UIKit

public final class BaseNavigationController: UINavigationController {
    let presentaionDIProvider: PresentaionDIProvider
    
    public init(presentaionDIProvider: PresentaionDIProvider, rootViewController: UIViewController) {
        self.presentaionDIProvider = presentaionDIProvider
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
