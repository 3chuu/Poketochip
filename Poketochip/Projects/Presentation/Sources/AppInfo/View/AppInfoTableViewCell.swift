//
//  AppInfoTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 2/8/24.
//

import UIKit
import SnapKit

final class AppInfoTableViewCell: UITableViewCell {
    static let cellId: String = "AppInfoTableViewCell"
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        
//        let config = Image
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setAutoLayout()
    }
    
    private func setAutoLayout() {
        addSubviews(titleLable)
        addSubviews(chevronImageView)
        
        titleLable.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(33)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLable.snp.centerY)
            $0.trailing.equalToSuperview().inset(25)
            $0.size.equalTo(24)
        }
    }
}

extension AppInfoTableViewCell {
    public func setTitle(type: AppInfoType) {
        titleLable.text = type.title
    }
}
