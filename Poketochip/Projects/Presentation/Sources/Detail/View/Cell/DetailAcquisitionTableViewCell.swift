//
//  DetailAcquisitionTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit
import SnapKit

final class DetailAcquisitionTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "DetailAcquisitionCellIdentifier"
    // MARK: View
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "획득 방법"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
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
        setHeaderLabel()
        setContentLabel()
    }
    
    func setData(_ data: String) {
        contentLabel.text = data
    }
}

extension DetailAcquisitionTableViewCell {
    private func setHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(16)
            make.height.equalTo(22)
        }
    }
    
    private func setContentLabel() {
        addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(30)
            make.bottom.equalToSuperview()
        }
    }
}
