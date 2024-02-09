//
//  BagViewController.swift
//  Presentation
//
//  Created by cha_nyeong on 2/4/24.
//

import UIKit
import SnapKit

final class BagViewController: BaseViewController<BagViewModel> {
    
    let dummyData: [(image: String, title: String)] = [
        (image:"" ,title:"몬스터볼"),
        (image:"" ,title:"도구"),
        (image:"" ,title:"열매")
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// autoLayout 설정
    override func setAutoLayout() {
        super.setAutoLayout()
        
        
        // Add tableView to the view
        view.addSubview(tableView)
        
        // Set constraints for tableView
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
    override func bind() {
        // Set dataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    /// 이외의 attributes 설정
    override func setAttributes() {
        super.setAttributes()

        navigationItem.title = "도구"
        registerCell()
    }
    
    func registerCell() {
        tableView.register(BagTableViewCell.self, forCellReuseIdentifier: BagTableViewCell.cellId)
    }
    
}

extension BagViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue or create your custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BagTableViewCell.cellId, for: indexPath) as? BagTableViewCell else {
            return BagTableViewCell()
        }
        // Add any other constraints for the cell's content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row to remove the selection highlight
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Perform the segue or push to the next view controller
        let nextViewController = BagDetailViewController(viewModel: BagViewModel()) // Replace with your destination view controller
        navigationController?.pushViewController(nextViewController, animated: true)
        
        // Alternatively, if using segues in Storyboard, performSegue(withIdentifier: "YourSegueIdentifier", sender: self)
    }
    
}


