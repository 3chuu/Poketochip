//
//  DetailInfoTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit

final class DetailInfoTableViewCell: UITableViewCell {
    static let cellId: String = "DetailInfoCellIdentifier"
    
    // MARK: View
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    private let categoryLabel: DetailInfoTypeView = {
        let view = DetailInfoTypeView()
        view.setInfoType(type: .category)
        return view
    }()
    
    private let typeLabel: DetailInfoTypeView = {
        let view = DetailInfoTypeView()
        view.setInfoType(type: .type)
        return view
    }()
    
    private let heightLabel: DetailInfoTypeView = {
        let view = DetailInfoTypeView()
        view.setInfoType(type: .height)
        return view
    }()
    
    private let weightLabel: DetailInfoTypeView = {
        let view = DetailInfoTypeView()
        view.setInfoType(type: .weight)
        return view
    }()
    
    private let characterLabel: DetailInfoTypeView = {
        let view = DetailInfoTypeView()
        view.setInfoType(type: .character)
        return view
    }()
    
    private let showMoreInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 알아보기", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .thin)
        return button
    }()

    
    // MARK: Initialize Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: ConfigureUI
    private func configureUI() {
        setAutoLayout()
    }
    
    internal func setData(_ data: SamplePokemonInfo) {
        categoryLabel.updateContent(data.category)
        typeLabel.updateContent(data.type)
        heightLabel.updateContent("\(data.height)m")
        weightLabel.updateContent("\(data.weight)kg")
        characterLabel.updateContent(data.character)
    }
}

extension DetailInfoTableViewCell {
    private func setAutoLayout() {
        let halfWidth = self.bounds.width / 2
        
        addSubview(containerView)
        containerView.addSubview(categoryLabel)
        containerView.addSubview(heightLabel)
        containerView.addSubview(characterLabel)
        containerView.addSubview(typeLabel)
        containerView.addSubview(weightLabel)
        addSubview(showMoreInfoButton)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(148)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(26)
        }
        
        heightLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(26)
        }
        
        characterLabel.snp.makeConstraints {
            $0.top.equalTo(heightLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(26)
        }
       
        typeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(halfWidth)
            $0.height.equalTo(26)
        }
        
        weightLabel.snp.makeConstraints {
            $0.top.equalTo(typeLabel.snp.bottom).offset(15)
            $0.height.equalTo(26)
            $0.leading.equalTo(halfWidth)
        }
        
        showMoreInfoButton.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(15)
            $0.trailing.equalTo(containerView.snp.trailing)
            $0.height.equalTo(15)
            $0.bottom.equalToSuperview()
        }
    }
}
