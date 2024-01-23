//
//  FavoritePokemonCollectionViewCell.swift
//  App
//
//  Created by 마경미 on 17.01.24.
//

import UIKit

import SnapKit
import Kingfisher

final class FavoritePokemonCollectionViewCell: UICollectionViewCell {
    static let id = "favoritePokemonCollectionViewCell"
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Medium", size: 12)
        label.textColor = UIColor(red: 0.447, green: 0.471, blue: 0.498, alpha: 1)
        label.text = "No.0035"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Medium", size: 12)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "삐삐"
        return label
    }()
    
    private let pokemonTypeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritePokemonCollectionViewCell {
    private func setLayout() {
        addSubviews(numberLabel, nameLabel, pokemonTypeImageView,
                    pokemonImageView)
        
        numberLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(12)
            $0.height.equalTo(10)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.bottom).offset(2)
            $0.leading.equalTo(numberLabel)
            $0.height.equalTo(12)
        }
        
        pokemonImageView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview().inset(12)
            $0.height.equalTo(pokemonImageView.snp.width)
        }
    }
    
    private func setStyles() {
        
    }
}

extension FavoritePokemonCollectionViewCell {
    func setCell(data: PokemonCell) {
        numberLabel.text = "No.00\(data.number)"
        nameLabel.text = data.name
        pokemonTypeImageView.image = UIImage(named: data.type)
        pokemonImageView.kf.setImage(with: URL(string: data.imageURL)!)
    }
}
