//
//  HomeNavigationView.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class HomeNavigationView: BaseView<EmptyViewModel> {
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton()
        button.tintColor = .gray800
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        return button
    }()
    
    var rightButtonTap: ControlEvent<Void> {
        return rightButton.rx.tap
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        addSubviews(logoImageView, rightButton)
        
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(44)
        }
        
        rightButton.snp.makeConstraints {
            $0.size.equalTo(32)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
