//
//  GameVersionSheetViewController.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import SnapKit
import Common

final class GameVersionSheetViewController: BaseViewController<GameVersionSheetViewModel> {
    private let versionTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 70
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func bind() {
        versionTableView.delegate = self
        versionTableView.dataSource = self
    }
    
    override func configureUI() {
        super.configureUI()
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubviews(versionTableView)
        
        versionTableView.snp.makeConstraints {
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide).inset(36)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    override func setAttributes() {
        super.setAttributes()
        
        versionTableView.register(GameVersionTableViewCell.self, forCellReuseIdentifier: GameVersionTableViewCell.cellId)
    }
}

extension GameVersionSheetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GameVersionTableViewCell(viewModel: .init(version: viewModel.versions[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedVersion.accept(viewModel.versions[indexPath.row])
        self.dismiss(animated: true)
    }
}
