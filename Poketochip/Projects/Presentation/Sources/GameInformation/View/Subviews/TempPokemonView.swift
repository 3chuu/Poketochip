//
//  TempPokemonView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/23/24.
//

import UIKit
import SnapKit
import Common

class TempPokemonView: UIView {

    private let pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let pokemonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Medium", size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    
    init(imageURL: UIImage, text: String) {
        super.init(frame: .zero)
        
        pokemonImage.image = imageURL
        pokemonLabel.text = text
        
        // 뷰에 UILabel 추가
        addSubviews(pokemonImage, pokemonLabel)
        
        // Auto Layout 설정
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
