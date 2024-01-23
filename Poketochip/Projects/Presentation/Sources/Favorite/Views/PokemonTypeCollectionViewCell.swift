//
//  TypeCollectionViewCell.swift
//  App
//
//  Created by 마경미 on 17.01.24.
//

import UIKit

import SnapKit

final class PokemonTypeCollectionViewCell: UICollectionViewCell {
    static let id = "pokemonTypeCollectionViewCell"
    
    private let typeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonTypeCollectionViewCell {
    private  func setLayout() {
        addSubviews(typeImageView, typeLabel)
        
        typeImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        typeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyels() {
        
    }
}

extension PokemonTypeCollectionViewCell {
    func setCell(data: PokemonTypeCell) {
        typeImageView.image = UIImage(named: data.type)
        typeLabel.text = data.type
    }
}
