//
//  CutomTabBarItem.swift
//  Common
//
//  Created by 윤지호 on 2/5/24.
//

import UIKit
import SnapKit
import RxSwift
import RxRelay

public enum TabBarItemCase {
    case appInfo
    case favorite
    
    var image: UIImage {
        switch self {
        case .appInfo:
            return UIImage(resource: .iconAppInfo)
        case .favorite:
            return UIImage(resource: .iconStar)
        }
    }
    
    var title: String {
        switch self {
        case .appInfo:
            return "게임 정보"
        case .favorite:
            return "즐겨찾기"
        }
    }
}

/// 추후 BaseView가 Common으로 옮겨진다음 BaseView 상속
public final class CutomTabBarItem: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
      bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setAutoLayout()
        setAttribute()
    }
    
    private func bind() {
        
    }
}

extension CutomTabBarItem {
    private func setAutoLayout() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.height.equalTo(20)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(-10)
            $0.centerX.bottom.equalToSuperview()
        }
    }
    
    private func setAttribute() {
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 10, weight: .bold)
    }
}

extension CutomTabBarItem {
    public func setItem(itemCase: TabBarItemCase) {
        imageView.image = itemCase.image
        titleLabel.text = itemCase.title
    }
}
