//
//  BaseView.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import UIKit

import RxSwift

class BaseView<ViewModelType>: UIView {
    var viewModel: ViewModelType?
    let disposeBag = DisposeBag()
    
    convenience init(viewModel: ViewModelType) {
        self.init(frame: .zero)
        self.viewModel = viewModel
        bind(viewModel: viewModel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(viewModel: ViewModelType) {
        
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
