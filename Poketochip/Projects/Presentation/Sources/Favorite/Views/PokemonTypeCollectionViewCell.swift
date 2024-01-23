//
//  TypeCollectionViewCell.swift
//  App
//
//  Created by 마경미 on 17.01.24.
//

import UIKit

import SnapKit

final class PokemonTypeCollectionViewCell: UICollectionViewCell {
    static let cellId = "pokemonTypeCollectionViewCell"
    
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
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setAutoLayout()
    }
}

extension PokemonTypeCollectionViewCell {
    private func setAutoLayout() {
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
}

extension PokemonTypeCollectionViewCell {
    func setCell(data: PokemonTypeCell) {
        typeImageView.image = UIImage(named: data.type)
        typeLabel.text = data.type
    }
}
