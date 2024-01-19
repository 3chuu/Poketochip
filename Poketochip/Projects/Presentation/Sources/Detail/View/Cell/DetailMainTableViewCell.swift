//
//  DetailMainTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit
import SnapKit

final class DetailMainTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "DetailMainCellIdentifier"
    
    // MARK: View
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .gray
        return button
    }()
    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    private let previousPokemonButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = UIColor.lightGray
        return button
    }()
    private let nextPokemonButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.lightGray
        return button
    }()
    private let introduceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Initialize Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: ConfigureUI()
    func configureUI() {
        setView()
    }
    
    func setData(_ data: SamplePokemon) {
        numberLabel.text = "No. \(data.number)"
        nameLabel.text = data.name
        pokemonImageView.image = data.image
        introduceLabel.text = data.introduce
    }
}

extension DetailMainTableViewCell {
    private func setView() {
        addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(36)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(27)
        }
        
        addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(57)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(32)
        }
        
        addSubview(pokemonImageView)
        pokemonImageView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(23)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
            
        }
        
        addSubview(previousPokemonButton)
        previousPokemonButton.snp.makeConstraints { make in
            make.bottom.equalTo(pokemonImageView.snp.bottom)
            make.leading.equalToSuperview().inset(18)
            make.height.equalTo(16)
        }
        
        addSubview(nextPokemonButton)
        nextPokemonButton.snp.makeConstraints { make in
            make.bottom.equalTo(pokemonImageView.snp.bottom)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(16)
        }
        
        addSubview(introduceLabel)
        introduceLabel.snp.makeConstraints { make in
            make.top.equalTo(pokemonImageView.snp.bottom).offset(23)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(34)
            make.bottom.equalToSuperview()
        }
    }
}
