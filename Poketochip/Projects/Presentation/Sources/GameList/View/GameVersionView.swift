//
//  GameVersionView.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import Common

import SnapKit

final class GameVersionView: BaseView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let legendaryImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.tintColor = .mainRed
        imageView.image = CommonAsset.chevronCircle.image
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        addSubviews(titleLabel, legendaryImageView, arrowImageView)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        legendaryImageView.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
