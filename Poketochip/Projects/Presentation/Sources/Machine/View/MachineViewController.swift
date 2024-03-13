//
//  BagViewController.swift
//  Presentation
//
//  Created by cha_nyeong on 2/4/24.
//

import UIKit
import SnapKit
import Common

public final class MachineViewController: BaseViewController<MachineViewModel> {
    
    private let isSelected: Bool = false
    
    let dummyData: [Machine] = Machine.dummyData
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "'불대문자'를 검색해보세요."
        return searchBar
    }()
    
    private var emptyMachineView = {
        let view = EmptyMachineView()
        view.isHidden = false
        return view
    }()
    private var selectedMachineView = {
        let view = SelectedMachineView()
        view.isHidden = true
        return view
    }()
    
//    private var machineInfoView: UIView {
//        isSelected ? SelectedMachineView() : EmptyMachineView()
//    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        return tableView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func bind() {
        // Set dataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self
    }

    /// autoLayout 설정
    override func setAutoLayout() {
        super.setAutoLayout()
        
        // Add tableView to the view
        view.addSubviews(searchBar, emptyMachineView, selectedMachineView, tableView)
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emptyMachineView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(140)
        }
        
        selectedMachineView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(140)
        }
        
        // Set constraints for tableView
        tableView.snp.makeConstraints {
            $0.top.equalTo(emptyMachineView.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    /// 이외의 attributes 설정
    override func setAttributes() {
        super.setAttributes()
        
        navigationItem.title = "기술 / 비전 머신"
        registerCell()
    }
    
    func registerCell() {
        tableView.register(MachineTableViewCell.self, forCellReuseIdentifier: MachineTableViewCell.cellId)
    }
    
}

extension MachineViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return dummyData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue or create your custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MachineTableViewCell.cellId, for: indexPath) as? MachineTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setData(machine: dummyData[indexPath.row])
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMachineView.setData(machine: dummyData[indexPath.row])
        
        emptyMachineView.isHidden = true
        selectedMachineView.isHidden = false
        
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        emptyMachineView.isHidden = false
        selectedMachineView.isHidden = true
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension MachineViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

