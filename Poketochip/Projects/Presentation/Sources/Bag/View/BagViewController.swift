//
//  BagViewController.swift
//  Presentation
//
//  Created by cha_nyeong on 2/4/24.
//

import UIKit
import SnapKit

final class BagViewController: BaseViewController<GameInformationViewModel>, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    
    public override func viewDidLoad() {
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
    
    /// 이외의 attributes 설정
    override func setAttributes() {
        super.setAttributes()
        
        navigationItem.title = "DP 디아루가 가방"

        // Set dataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self

    }
}

extension BagViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue or create your custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! YourCustomCellClass
        
        // Configure cell's contents, including the image view
        cell.customImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        
        // Add any other constraints for the cell's content
        
        return cell
    }
}
