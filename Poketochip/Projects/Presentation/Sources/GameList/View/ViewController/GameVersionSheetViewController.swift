//
//  GameVersionSheetViewController.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import SnapKit

final class GameVersionSheetViewController: BaseViewController<GameVersionSheetViewModel> {
    private let versionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func bind() {
        // 추후에 viewModel init 이벤트를 받아 binding으로 바꾸기
        viewModel.versions.forEach {
            let versionView = GameVersionView(viewModel: .init(version: $0))
            versionStackView.addArrangedSubview(versionView)
        }
    }
    
    override func configureUI() {
        super.configureUI()
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubviews(versionStackView)
        
        versionStackView.snp.makeConstraints {
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
