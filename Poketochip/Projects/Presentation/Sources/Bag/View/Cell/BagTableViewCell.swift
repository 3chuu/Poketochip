//
//  BagTableViewCell.swift
//  Presentation
//
//  Created by cha_nyeong on 2/4/24.
//

import UIKit

final class BagTableViewCell: UITableViewCell {
    static let cellId: String = "BagCellIdentifier"
    
    // MARK: View
    private let bagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Bold", size: 14)
        return label
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
        setAutoLayout()
    }
    
    private func setAutoLayout() {
        addSubviews(bagImageView,titleLabel)
        
        bagImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bagImageView)
            $0.leading.equalTo(bagImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(14)
        }
        
    }
    
    public func setData(_ data: UIImage,_ title: String) {
        bagImageView.image = data
        titleLabel.text = title
    }
    
}
