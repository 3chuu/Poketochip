//
//  LegendaryPokemonSectionView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/21/24.
//

import UIKit
import Common
import SnapKit
import RxSwift
import RxCocoa

final class LegendaryPokemonSectionView: BaseView<EmptyViewModel> {
    
    // MARK: View
    private let innerView: UIView = .init()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Bold", size: 16)
        label.text = "전설의 포켓몬"
        label.textAlignment = .left
        return label
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.setImage(CommonAsset.chevronUpCircle.image, for: .normal)
        return button
    }()
    
    private let pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        imageView.image = CommonAsset.dummyPokemon.image
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Bold", size: 14)
        label.textColor = UIColor(red: 0.949, green: 0.306, blue: 0.118, alpha: 1)
        label.text = "디아루가(Dialga)"
        label.textAlignment = .left
        return label
    }()
    
    private let pokemonSortLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Light", size: 12)
        label.text = "시간 포켓몬"
        return label
    }()
    
    private let pokemonTypeView: TempCapsuleView = {
        let view = TempCapsuleView(text: "강철", backgroundColor: .gray)
        return view
    }()
    
    private let pokemonTypeView2: TempCapsuleView = {
        let view = TempCapsuleView(text: "드래곤", backgroundColor: .purple)
        return view
    }()
    
    
    // MARK: Rx Property
    var onTapDetail: ControlEvent<Void> {
        return detailButton.rx.tap
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    // MARK: Initialize Method
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        addSubviews(titleLabel, innerView)
        innerView.addSubviews(pokemonImage, pokemonNameLabel, pokemonSortLabel, pokemonTypeView, pokemonTypeView2, detailButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(16)
        }
        
        innerView.snp.makeConstraints { 
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        pokemonImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(14)
            $0.width.equalTo(84)
            $0.height.equalTo(84)
        }
        
        detailButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        pokemonNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalTo(pokemonImage.snp.trailing).offset(14)
            $0.trailing.equalTo(detailButton.snp.leading)
                .offset(14)
        }
        
        pokemonSortLabel.snp.makeConstraints {
            $0.top.equalTo(pokemonNameLabel.snp.bottom).offset(30)
            $0.leading.equalTo(pokemonImage.snp.trailing)
                .offset(14)
//            $0.height.equalTo(12)
        }
        
        pokemonTypeView.snp.makeConstraints {
            $0.top.equalTo(pokemonSortLabel.snp.bottom)
                .offset(4)
            $0.leading.equalTo(pokemonImage.snp.trailing)
                .offset(14)
            $0.bottom.equalToSuperview()
                .offset(14)
        }
        
        pokemonTypeView2.snp.makeConstraints {
            $0.top.equalTo(pokemonSortLabel.snp.bottom)
                .offset(4)
            $0.leading.equalTo(pokemonTypeView.snp.trailing)
                .offset(14)
            $0.bottom.equalToSuperview()
                .offset(14)
        }
    }
}

