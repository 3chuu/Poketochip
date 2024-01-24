//
//  ProductInformationSectionView.swift
//  Presentation
//
//  Created by cha_nyeong on 1/21/24.
//

import UIKit

final class ProductInformationSectionView: BaseView {
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        return stackView
    }()
    
    // 게임 정보 라벨
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "게임 정보"
        label.textColor = UIColor(red: 0.271, green: 0.298, blue: 0.325, alpha: 1)
        label.font = UIFont(name: "GmarketSans-Bold", size: 16)
        return label
    }()
    
    // 중간 StackView 생성
    let middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // 관련 링크
    let linkView: UIView = {
        let view = UIView()
        
        
        // 이미지 설정
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "yourImageName")
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
            $0.trailing.centerY.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        label.snp.makeConstraints {
            $0.trailing.equalTo(imageView.snp.leading).offset(5)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(14)
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
        
        let contentView1 = createContentView(leftLabelText: "발매일", rightLabelText: "2022년 11월")
        let contentView2 = createContentView(leftLabelText: "대응기기", rightLabelText: "Nintendo Switch")
        let contentView3 = createContentView(leftLabelText: "게임 장르", rightLabelText: "RPG")
        let contentView4 = createContentView(leftLabelText: "플레이 인원", rightLabelText: "1명")
        let contentView5 = createContentView(leftLabelText: "발매원", rightLabelText: "한국닌텐도(주)")
        let contentView6 = createContentView(leftLabelText: "희망소비자가격", rightLabelText: "64,800원")
        
        [contentView1,contentView2,contentView3,contentView4,contentView5,contentView6].forEach {
            middleStackView.addArrangedSubview($0)
        }
        
        [titleLabel, middleStackView, linkView].forEach {
            mainStackView.addArrangedSubview($0)
        }
    }
    
}

extension ProductInformationSectionView {
    private func createContentView(leftLabelText: String, rightLabelText: String) -> UIView {
        let view: UIView = {
            let view = UIView()
            
            // 좌측 라벨
            let leftLabel: UILabel = {
                let label = UILabel()
                label.text = leftLabelText
                label.textAlignment = .left
                label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                label.font = UIFont(name: "GmarketSans-Bold", size: 14)
                return label
            }()
            
            // 우측 라벨
            let rightLabel: UILabel = {
                let label = UILabel()
                label.text = rightLabelText
                label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                label.font = UIFont(name: "GmarketSans-Medium", size: 14)
                label.textAlignment = .right
                return label
            }()
            
            // 각 UIView에 좌우에 라벨 추가
            view.addSubviews(leftLabel,rightLabel)
            
            // SnapKit을 사용한 오토레이아웃 설정
            leftLabel.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.centerY.equalToSuperview()
                $0.width.lessThanOrEqualTo(100)
            }
            
            rightLabel.snp.makeConstraints {
                $0.trailing.equalToSuperview()
                $0.centerY.equalToSuperview()
                $0.leading.equalTo(leftLabel.snp.trailing).offset(10)
            }
            
            return view
        }()
        
        return view
    }
}

