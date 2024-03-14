//
//  GameVersionView.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import Common

import SnapKit

final class GameVersionView: BaseView<GameVersionViewModel> {
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
        imageView.tintColor = .mainRed
        imageView.image = CommonAsset.chevronCircle.image
        return imageView
    }()
    
    override func bind(viewModel: GameVersionViewModel) {
        titleLabel.text = "\(viewModel.version.name) 버전 보기"
        legendaryImageView.kf.setImage(with: URL(string: viewModel.version.legendaryImageURL))
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
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(-10)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
