//
//  AViewController.swift
//  Feature
//
//  Created by 윤지호 on 12/11/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import UIKit
import SnapKit

class AViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        self.view.addSubview(button)
        button.setTitle("hi", for: .normal)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
