//
//  GameVersionSheetViewController.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import SnapKit

final class GameVersionSheetViewController: BaseViewController<GameVersionViewModel> {

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
    
    override func configureUI() {
        super.configureUI()
        setStackView()
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubviews(versionStackView)
        
        versionStackView.snp.makeConstraints {
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func setStackView() {
//        viewModel.versions.forEach
        let versionView = GameVersionView()
        versionStackView.addArrangedSubview(versionView)
    }
}
