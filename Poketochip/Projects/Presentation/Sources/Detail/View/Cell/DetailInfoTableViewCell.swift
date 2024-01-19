//
//  DetailInfoTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit

final class DetailInfoTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "DetailInfoCellIdentifier"
    
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
        setContainView()
        setLabel()
        setShowMoreInfoButton()
    }

    func setData(_ data: SamplePokemonInfo) {
        categoryLabel.updateContent(data.category)
        typeLabel.updateContent(data.type)
        heightLabel.updateContent("\(data.height)m")
        weightLabel.updateContent("\(data.weight)kg")
        characterLabel.updateContent(data.character)
    }
}

extension DetailInfoTableViewCell {
    func setContainView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(148)
        }
    }
    
    func setLabel() {
        containerView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(26)
        }
        
        containerView.addSubview(heightLabel)
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(26)
        }
        
        containerView.addSubview(characterLabel)
        characterLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(26)
        }
        
        let halfWidth = self.bounds.width / 2

        containerView.addSubview(typeLabel)
        typeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(halfWidth)
            make.height.equalTo(26)
        }
        
        containerView.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(15)
            make.height.equalTo(26)
            make.leading.equalTo(halfWidth)
        }
    }
    
    func setShowMoreInfoButton() {
        addSubview(showMoreInfoButton)
        showMoreInfoButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(15)
            make.trailing.equalTo(containerView.snp.trailing)
            make.height.equalTo(15)
            make.bottom.equalToSuperview()
        }
    }
}
