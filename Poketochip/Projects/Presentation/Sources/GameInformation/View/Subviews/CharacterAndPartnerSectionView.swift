//
//  CharacterAndPartnerSectionView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/21/24.
//

import UIKit

final class CharacterAndPartnerSectionView: BaseView {
    
    private let view: UIView = .init()
    private let innerView: UIView = .init()
    private let stackArrangeView: UIView = .init()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Bold", size: 16)
        label.text = "주인공 및 모험의 첫 파트너"
        label.textAlignment = .left
        return label
    }()
    
    private let characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Medium", size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "보민 푸름"
        label.textAlignment = .center
        return label
    }()
    
    private let pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let pokemonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Medium", size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "포켓몬"
        label.textAlignment = .center
        return label
    }()
    
    private let horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 14
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
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
        
        view.addSubviews(titleLabel, innerView)
        innerView.addSubviews(characterImage,characterLabel, horizontalStackView)
        stackArrangeView.addSubviews(pokemonImage,pokemonLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(16)
        }
        
        innerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        characterImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(110)
        }
        
        characterLabel.snp.makeConstraints {
            $0.top.equalTo(characterImage.snp.bottom).offset(10)
            $0.width.equalTo(characterImage)
            $0.centerX.equalTo(characterImage)
            $0.bottom.equalToSuperview()
        }
        
        pokemonImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(64)
            $0.height.equalTo(64)
        }
        
        pokemonLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        for _ in 0..<3 {
            horizontalStackView.addArrangedSubview(stackArrangeView)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.equalTo(characterImage.snp.trailing).offset(14)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(88)
        }
    }
}

