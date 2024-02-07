//
//  BagDetailTableViewCell.swift
//  Presentation
//
//  Created by cha_nyeong on 2/4/24.
//

import UIKit

final class BagDetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static let cellId: String = "BagDetailCellIdentifier"
    
    // MARK: View
    private let bagDetailImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "태양의 돌"
        label.font = UIFont(name: "GmarketSans-Bold", size: 14)
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "어느 특정 포켓몬을 진화시키는 이상한 돌. 노을 처럼 붉게 빛난다."
        label.font = UIFont(name: "GmarketSans-Medium", size: 12)
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
        addSubviews(bagDetailImageView,titleLabel,detailLabel)
        
        bagDetailImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(8)
            $0.width.equalTo(64)
            $0.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(bagDetailImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(14)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(bagDetailImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
    
}
