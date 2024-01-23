//
//  DetailViewController.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

public final class DetailViewController: UIViewController {
    // MARK: View
    private let tableView: UITableView = UITableView(frame: .zero)
    
    // MARK: ViewModel
    private let viewModel: DetailViewModel = DetailViewModel()
    
    // MARK: Rx Property
    private let disposeBag = DisposeBag()
    
    // MARK: Initialize Method
    
    // MARK: LifeCycle Method
    public override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        configureUI()
    }
}

extension DetailViewController {
    // MARK: Bind
    private func bind() {
        // rx로 이동하기
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: ConfigureUI
    private func configureUI() {
        setAutoLayout()
        setAttribute()
    }
}

extension DetailViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSouceCount
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCase = viewModel.dataSouce[indexPath.section]
        
        switch cellCase {
        case .main(let samplePokemon):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMainTableViewCell.cellId, for: indexPath) as? DetailMainTableViewCell else {
                return UITableViewCell()
            }
            cell.setData(samplePokemon)
            return cell
        case .info(let samplePokemonInfo):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoTableViewCell.cellId, for: indexPath) as? DetailInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setData(samplePokemonInfo)
            return cell
        case .acquisitionPath(let string):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailAcquisitionTableViewCell.cellId, for: indexPath) as? DetailAcquisitionTableViewCell else {
                return UITableViewCell()
            }
            cell.setData(string)
            return cell
        case .evelution(let samplePokemonEvolution):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailEvolutionTableViewCell.cellId, for: indexPath) as? DetailEvolutionTableViewCell else {
                return UITableViewCell()
            }
            cell.setData(samplePokemonEvolution)
            return cell
        case .stat(let samplePokemonStat):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailStatTableViewCell.cellId, for: indexPath) as? DetailStatTableViewCell else {
                return UITableViewCell()
            }
            cell.setData(samplePokemonStat)
            return cell
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension DetailViewController {
    private func setAutoLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func setAttribute() {
        tableView.separatorInset.top = 20
        tableView.separatorStyle = .none
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(DetailMainTableViewCell.self, forCellReuseIdentifier: DetailMainTableViewCell.cellId)
        tableView.register(DetailInfoTableViewCell.self, forCellReuseIdentifier: DetailInfoTableViewCell.cellId)
        tableView.register(DetailAcquisitionTableViewCell.self, forCellReuseIdentifier: DetailAcquisitionTableViewCell.cellId)
        tableView.register(DetailEvolutionTableViewCell.self, forCellReuseIdentifier: DetailEvolutionTableViewCell.cellId)
        tableView.register(DetailStatTableViewCell.self, forCellReuseIdentifier: DetailStatTableViewCell.cellId)
    }
}
