//
//  BagDetailViewController.swift
//  Presentation
//
//  Created by cha_nyeong on 2/4/24.
//

import UIKit

class BagDetailViewController: BaseViewController<BagViewModel> {
    
    // 데이터 모델
    var sections: [Section] = []
    var selectedIndexPath: IndexPath?
    
    private let tableView = UITableView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 섹션 데이터 초기화
        sections = [
            Section(title: "태양의 돌", detail: "어느 특정 포켓몬을 진화시키는 이상한 돌. 노을처럼 붉게 빛난다.", expanded: false, items: ["획득 경로 : 벌레잡기 대회 1등 상품", "가격 : 비매품"]),
            Section(title: "태양의 돌", detail: "어느 특정 포켓몬을 진화시키는 이상한 돌. 노을처럼 붉게 빛난다.", expanded: false, items: ["획득 경로 : 지하통로, 입지호수근처Pt, 천관산Pt", "가격 : 1050원"]),
            Section(title: "태양의 돌", detail: "어느 특정한 포켓몬을 진화시키는 이상한 돌. 태양처럼 빨갛다.", expanded: false, items: ["획득 경로 : 야생의 솔록이 5%의 확률로 지니고 있다.", "가격 : 10000원"])
        ]
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
        
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        navigationItem.title = "DP 디아루가 가방"
        registerCell()
    }
    
    func registerCell() {
        tableView.register(BagTableViewCell.self, forCellReuseIdentifier: BagTableViewCell.cellId)
    }
}

extension BagDetailViewController: UITableViewDataSource, UITableViewDelegate  {
    
    internal func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 7
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue or create your custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! BagDetailTableViewCell
        
        // Add any other constraints for the cell's content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row to remove the selection highlight
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        // Alternatively, if using segues in Storyboard, performSegue(withIdentifier: "YourSegueIdentifier", sender: self)
    }
}



struct Section {
    var title: String
    var detail: String
    var expanded: Bool
    var items: [String]
}


/*
import UIKit

class AccordionTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()



    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].expanded ? sections[section].items.count + 1 : 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            // 첫 번째 셀은 섹션 헤더 셀
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath)
            cell.textLabel?.text = sections[indexPath.section].title
            return cell
        } else {
            // 나머지 셀은 아코디언 형태의 뷰를 포함한 셀
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccordionCell", for: indexPath)
            // 아코디언 형태의 뷰를 추가하고 설정
            configureAccordionView(cell, for: indexPath)
            return cell
        }
    }

    // MARK: - UITableViewDelegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // 섹션 헤더를 선택한 경우에만 동작
            sections[indexPath.section].expanded.toggle()
            tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
        }
    }

    // MARK: - Configure Accordion View

    func configureAccordionView(_ cell: UITableViewCell, for indexPath: IndexPath) {
        // 아코디언 형태의 뷰를 추가하고 설정
        let accordionView = UIView()
        accordionView.backgroundColor = .lightGray
        accordionView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(accordionView)

        // 뷰의 제약 조건 설정
        accordionView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
        accordionView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        accordionView.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        accordionView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        // 아코디언 뷰의 내용 설정
        let label = UILabel()
        label.text = "Additional Content"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        accordionView.addSubview(label)

        label.centerXAnchor.constraint(equalTo: accordionView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: accordionView.centerYAnchor).isActive = true
    }
}
*/
