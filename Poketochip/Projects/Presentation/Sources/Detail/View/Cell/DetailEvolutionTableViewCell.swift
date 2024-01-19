//
//  DetailEvolutionTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit

final class DetailEvolutionTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "DetailEvolutionCellIdentifier"

    // MARK: View
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "진화"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: Initialize Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ConfigureUI
    private func configureUI() {
        setHeaderLabel()
        setStackView()
    }
    
    func setData(_ data: SamplePokemonEvolution) {
        var pokemons = data.pokemons.sorted(by: { $0.number < $1.number })

        for index in 0..<pokemons.count {
            if index > 0 && index < pokemons.count {
                let imageView: UIImageView = {
                    let imageView = UIImageView()
                    imageView.image = UIImage(systemName: "chevron.right")
                    imageView.tintColor = .gray
                    imageView.contentMode = .scaleAspectFit
                    return imageView
                }()
                
                imageView.snp.makeConstraints { make in
                    make.size.equalTo(14)
                }
                
                stackView.addArrangedSubview(imageView)
            }
            
            let pokemonView: DetailEvolutionView = {
                let pokemonView = DetailEvolutionView()
                pokemonView.updateContent(pokemons[index])
                return pokemonView
            }()
            
            pokemonView.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(110)
            }
            
            stackView.addArrangedSubview(pokemonView)
        }
    }
}

extension DetailEvolutionTableViewCell {
    private func setHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(22)
        }
    }
    
    private func setStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(110)
            make.bottom.equalToSuperview()
        }
    }
}

