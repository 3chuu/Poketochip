//
//  MachineView.swift
//  Presentation
//
//  Created by cha_nyeong on 2/7/24.
//

import Foundation
import UIKit
import SnapKit
import Common

final class EmptyMachineView: BaseView<EmptyViewModel> {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "기술을 선택하여 주세요."
        label.textAlignment = .center
        return label
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
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        addSubview(textLabel)
        
        textLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
