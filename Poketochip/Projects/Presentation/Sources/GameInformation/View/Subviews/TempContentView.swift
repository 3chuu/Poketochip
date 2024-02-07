//
//  TempContentView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/23/24.
//

import UIKit
import SnapKit
import Common

final class TempContentView: UIView {
    
    // 좌측 라벨
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "GmarketSans-Bold", size: 14)
        return label
    }()
    
    // 우측 라벨
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "GmarketSans-Medium", size: 14)
        label.textAlignment = .right
        return label
    }()
    
    init(leftLabelText: String, rightLabelText: String) {
        super.init(frame: .zero)
        
        leftLabel.text = leftLabelText
        rightLabel.text = rightLabelText
        
        // 각 UIView에 좌우에 라벨 추가
        addSubviews(leftLabel,rightLabel)
        
        // SnapKit을 사용한 오토레이아웃 설정
        leftLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.lessThanOrEqualTo(150)
        }
        
        rightLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(leftLabel.snp.trailing).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
