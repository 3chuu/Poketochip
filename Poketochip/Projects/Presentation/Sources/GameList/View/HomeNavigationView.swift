//
//  HomeNavigationView.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import SnapKit

final class HomeNavigationView: BaseView {
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let rightButton: UIButton = {
        let button = UIButton()
//        button.tintColor = .gray800
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        addSubviews(logoImageView, rightButton)
        
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalTo(120)
            $0.height.equalTo(44)
        }
        
        rightButton.snp.makeConstraints {
            $0.size.equalTo(32)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
