//
//  GameListViewController.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import SnapKit

final class GameListViewController: BaseViewController<GameListViewModel> {
    private let navigationView: HomeNavigationView = {
        let view = HomeNavigationView()
        return view
    }()
    
    private let gameTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func bind() {
        super.bind()
        
        gameTableView.delegate = self
        gameTableView.dataSource = self
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubviews(navigationView, gameTableView)
        
        navigationView.snp.makeConstraints {
            $0.height.equalTo(64)
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        gameTableView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension GameListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameModel.tempGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.cellId, for: indexPath) as? GameTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(GameModel.tempGames[indexPath.row])
        return cell
    }
}