//
//  BaseViewController.swift
//  App
//
//  Created by 마경미 on 19.01.24.
//

import UIKit
import SnapKit
import RxSwift

public class BaseViewController<ViewModelType>: UIViewController {
    let viewModel: ViewModelType
    let disposeBag = DisposeBag()

    public init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        configureUI()
    }
    
    /// viewModel data binding
    func bind() {
        
    }
    
    // UI 설정에 관한 모든 메서드 호출
    func configureUI() {
        setAutoLayout()
        setAttributes()
    }
    
    /// autoLayout 설정
    func setAutoLayout() {
        
    }
    
    /// 이외의 attributes 설정
    func setAttributes() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemBackground
    }
}
