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

        self.view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(view.centerXAnchor)
            make.centerY.equalTo(view.centerYAnchor)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
