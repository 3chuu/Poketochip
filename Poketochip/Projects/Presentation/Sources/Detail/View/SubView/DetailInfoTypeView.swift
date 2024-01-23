//
//  DetailCategoryLabel.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit

final class DetailInfoTypeView: UIView {
    // MARK: View
    private let infoTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        
        label.layer.cornerRadius = 13
        label.clipsToBounds = true
        
        return label
    }()
    
    private let contentLabel: UILabel = {
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
    
    public func setInfoType(type: DetailInfoCategory) {
        infoTypeLabel.text = type.type
        infoTypeLabel.backgroundColor = .systemPink
    }
    
    public func updateContent(_ content: String) {
        contentLabel.text = content
    }
}

extension DetailInfoTypeView {
    private func setAutoLayout() {
        addSubview(infoTypeLabel)
        addSubview(contentLabel)

        infoTypeLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(59)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalTo(infoTypeLabel.snp.trailing).offset(5)
        }
    }
}
