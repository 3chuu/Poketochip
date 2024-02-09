//
//  RegionSectionView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/21/24.
//

import UIKit
import Common
import SnapKit

final class RegionSectionView: BaseView {
    
    // 타이틀라벨
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "모험의 무대"
        label.textColor = UIColor(red: 0.271, green: 0.298, blue: 0.325, alpha: 1)
        label.font = UIFont(name: "GmarketSans-Bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    // 지방이미지
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = CommonAsset.dummyRegion.image
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // 지방라벨
    private let regionLabel: UILabel = {
        let label = UILabel()
        label.text = "신오지방"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "GmarketSans-Light", size: 12)
        label.textAlignment = .center
        return label
    }()
    
    // 설명라벨
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "아이부터 어른까지 즐길 수 있는 「포켓몬스터」 「포켓몬스터스칼렛・바이올렛」은, 「포켓몬스터」 시리즈 최초의 오픈 월드 RPG입니다. 포켓몬을 만나, 동료가 되고, 배틀하고, 육성하며, 교환하는 기존 시리즈의 재미 요소는 그대로 유지한 채, 더욱 진화한 모험을 마음껏 경험할 수 있습니다."
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "GmarketSans-Medium", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    // MARK: Initialize Method
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        setAutoLayout()
    }
    
    override func bind() {
        super.bind()
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        addSubviews(titleLabel,imageView,regionLabel,descriptionLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
                .inset(24)
        }
        
        regionLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
                .offset(12)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(regionLabel.snp.bottom)
                .offset(12)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}
