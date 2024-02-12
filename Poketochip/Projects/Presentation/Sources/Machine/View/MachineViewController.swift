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
    
    let dummyData: [(image: UIImage, title: String)] = [
        (image:CommonAsset.dummyPokeball.image ,title:"몬스터볼"),
        (image:CommonAsset.dummyTool.image ,title:"도구"),
        (image:CommonAsset.dummyBerry.image,title:"열매")
    ]
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "'불대문자'를 검색해보세요."
        return searchBar
    }()
    
    private var machineInfoView: BaseView { 
        isSelected ? SelectedMachineView() : EmptyMachineView()
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
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
        view.addSubviews(searchBar, machineInfoView, tableView)
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        machineInfoView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(140)
        }
        
        // Set constraints for tableView
        tableView.snp.makeConstraints {
            $0.top.equalTo(machineInfoView.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
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
        
//        cell.setData(dummyData[indexPath.row].image, dummyData[indexPath.row].title)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row to remove the selection highlight
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Perform the segue or push to the next view controller
        let nextViewController = BagDetailViewController(viewModel: BagDetailViewModel()) // Replace with your destination view controller
        navigationController?.pushViewController(nextViewController, animated: true)
        
        // Alternatively, if using segues in Storyboard, performSegue(withIdentifier: "YourSegueIdentifier", sender: self)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

extension MachineViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

