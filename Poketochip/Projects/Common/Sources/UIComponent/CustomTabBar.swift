//
//  CustomTabBar.swift
//  Common
//
//  Created by 윤지호 on 2/5/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CustomTabBar: UITabBar {
    
    // MARK: View
    private var shapeLayer: CALayer?

    private var middleButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(resource: .pokeBall)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 30
        button.clipsToBounds = true

        return button
    }()
    
    // MARK: Rx Property
    private let disposeBag = DisposeBag()
    public var isShowingButtonRelay: BehaviorRelay<Bool> = .init(value: false)
   
    // MARK: Initialize Property
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    private func configureUI() {
        setAutoLayout()
        setAttribute()
    }
    
    @objc func centerButtonTab() {
        var isShowingButton = isShowingButtonRelay.value
        isShowingButton.toggle()
        isShowingButtonRelay.accept(isShowingButton)
    }
}

extension CustomTabBar {
    private func setAutoLayout() {
        addSubview(middleButton)

        middleButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-26)
            $0.size.equalTo(70)
        }
    }
    
    private func setAttribute() {
        // tabbar
        self.barTintColor = .clear
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
        
        // button
        middleButton.addTarget(self, action: #selector(centerButtonTab), for: .touchUpInside)
    }
}

extension CustomTabBar {
    public func setIsShowingButtonBoolean() {
        isShowingButtonRelay.accept(false)
    }
}
