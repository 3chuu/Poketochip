//
//  ProductInformationSectionView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/21/24.
//

import UIKit
import Common
import SnapKit

final class ProductInformationSectionView: BaseView {
    
    private let contentView1 = TempContentView(leftLabelText: "발매일", rightLabelText: "2022년 11월")
    private let contentView2 = TempContentView(leftLabelText: "대응기기", rightLabelText: "Nintendo Switch")
    private let contentView3 = TempContentView(leftLabelText: "게임 장르", rightLabelText: "RPG")
    private let contentView4 = TempContentView(leftLabelText: "플레이 인원", rightLabelText: "1명")
    private let contentView5 = TempContentView(leftLabelText: "발매원", rightLabelText: "한국닌텐도(주)")
    private let contentView6 = TempContentView(leftLabelText: "희망소비자가격", rightLabelText: "64,800원")
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    // 중간 StackView 생성
    private let middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    // 게임 정보 라벨
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "게임 정보"
        label.textColor = UIColor(red: 0.271, green: 0.298, blue: 0.325, alpha: 1)
        label.font = UIFont(name: "GmarketSans-Bold", size: 16)
        return label
    }()
    
    
    // 관련 링크
    private let linkView: UIView = {
        let view = UIView()
        // 이미지 설정
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = CommonAsset.chevronUpCircleOrange.image
            return imageView
        }()
        // 텍스트 설정
        let label: UILabel = {
            let label = UILabel()
            label.text = "관련링크"
            label.textColor = .black
            label.font = UIFont(name: "GmarketSans-Bold", size: 14)
            return label
        }()
        
        view.addSubviews(label, imageView)
        
        imageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        label.snp.makeConstraints {
            $0.trailing.equalTo(imageView.snp.leading)
            $0.centerY.equalToSuperview()
        }
        // Tap Gesture 추가
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        view.addGestureRecognizer(tapGesture)

        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    // MARK: Initialize Method
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        setAutoLayout()
    }
    
    override func bind() {
        super.bind()
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        addSubviews(mainStackView, middleStackView)
        
        middleStackView.addArrangedSubviews(contentView1,contentView2,contentView3,contentView4,contentView5,contentView6)
        
        mainStackView.addArrangedSubviews(titleLabel,middleStackView,linkView)
        
        mainStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
