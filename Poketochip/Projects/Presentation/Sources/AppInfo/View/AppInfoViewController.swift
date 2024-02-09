//
//  AppInfoViewController.swift
//  Presentation
//
//  Created by 윤지호 on 2/8/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class AppInfoViewController: BaseViewController<AppInfoViewModel>, UITableViewDelegate  {
    
    //MARK: View
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    private let appVersionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "현재 앱 버전: 0.0.1 ver"
        return label
    }()
    
    private let termsOfUseView: AppInfoTermsOfUseView = {
        let view = AppInfoTermsOfUseView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .lightGray
        return view
    }()
    
    //MARK: Rx Property
    private let items = Observable.just(AppInfoType.allCases)

    //MARK: Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func bind() {
        super.bind()
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
                
        items
            .bind(to: tableView.rx.items) { tableView, _, element in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: AppInfoTableViewCell.cellId) as? AppInfoTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.setTitle(type: element)
                return cell
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .bind(with: self) { owner, indexPath in
                /// 추후 다음뷰로 push
                owner.tableView.deselectRow(at: indexPath, animated: true)
            }
            .disposed(by: disposeBag)
        
    }
    
    public override func setAutoLayout() {
        super.setAutoLayout()
        view.addSubview(termsOfUseView)
        view.addSubview(tableView)
        view.addSubview(appVersionLabel)
        
        termsOfUseView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(110)
        }
        
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        appVersionLabel.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(85)
        }
        
    }
    
    public override func setAttributes() {
        super.setAttributes()
        navigationItem.title = "앱 정보"
        
        tableView.separatorStyle = .none
        tableView.register(AppInfoTableViewCell.self, forCellReuseIdentifier: AppInfoTableViewCell.cellId)
    }
}


#Preview {
    AppInfoViewController(viewModel: AppInfoViewModel())
}
