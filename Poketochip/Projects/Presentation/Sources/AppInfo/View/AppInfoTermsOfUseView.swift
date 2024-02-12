//
//  AppInfoTermsOfUseView.swift
//  Presentation
//
//  Created by 윤지호 on 2/8/24.
//

import UIKit
import SnapKit

final class AppInfoTermsOfUseView: BaseView {
    
    //MARK: View
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let termsOfUseLabel: UILabel = {
        let label = UILabel()
        label.text = "이용약관"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.setTitle("개인정보처리방침", for: .normal)
        
        let title = NSAttributedString(
            string: "개인정보처리방침",
            attributes: [
                .font: UIFont.systemFont(ofSize: 10, weight: .semibold),
                .foregroundColor: UIColor.blue,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: UIColor.blue
            ]
        )
        button.setAttributedTitle(title, for: .normal)
        
        return button
    }()
    
    private let licenseLabel: UILabel = {
        let label = UILabel()
        label.text = "Copyright zgiyo all right reserved"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    override func setAutoLayout() {
        super.setAutoLayout()
        addSubview(contentView)
        contentView.addSubviews(termsOfUseLabel, privacyPolicyButton, licenseLabel)
        
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(18)
            $0.leading.trailing.equalToSuperview().inset(21)
        }
        
        termsOfUseLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(50)
        }
        
        privacyPolicyButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            $0.height.equalTo(50)
        }
        
        licenseLabel.snp.makeConstraints {
            $0.top.equalTo(termsOfUseLabel.snp.bottom)
            $0.height.equalTo(20)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
