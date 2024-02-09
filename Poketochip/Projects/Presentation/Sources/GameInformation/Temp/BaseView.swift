//
//  BaseView.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bind()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind() {
        
    }
    
    func configureUI() {
        setAutoLayout()
        setAttributes()
    }
    
    func setAutoLayout() {
        
    }
    
    func setAttributes() {

    }
}
