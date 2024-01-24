//
//  DetailEvolutionView.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit

final class DetailEvolutionView: UIView {
    
    // MARK: View
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // MARK: Initialize Method
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    // MARK: ConfigureUI
    private func configureUI() {
        setAutoLayout()
    }
    
    public func updateContent(_ content: SamplePokemonEvolution.Pokemon) {
        imageView.image = content.image
        pokemonNameLabel.text = content.name
    }
}

extension DetailEvolutionView {
    private func setAutoLayout() {
        addSubview(imageView)
        addSubview(pokemonNameLabel)

        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalTo(80)
        }
        
        pokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.centerX.bottom.equalToSuperview()
            make.height.equalTo(15)
        }
    }
}
