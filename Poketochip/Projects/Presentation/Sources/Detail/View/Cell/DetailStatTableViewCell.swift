//
//  DetailStatTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit
import SwiftUI

final class StateStore: ObservableObject {
    @Published var stat: [SamplePokemonStat] = SamplePokemonStatData().statData2
}


final class DetailStatTableViewCell: UITableViewCell {
    static let cellId: String = "DetailStatCellIdentifier"
  
    @ObservedObject var statStore = StateStore()
    
    // MARK: View
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "종족값"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
  
    private let totalStatLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private var chartView: UIHostingController<DetailStatChartView>?
    
    // MARK: Initialize Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        chartView = UIHostingController(rootView: DetailStatChartView(statStore: statStore))
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ConfigureUI
    private func configureUI() {
        setAutoLayout()
    }
    
    public func setData(_ data: SamplePokemonStatData) {
        let attributedString = NSMutableAttributedString(string: data.totalStat)
        
        let range = (data.totalStat as NSString).range(of: "총합:")
        attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 14, weight: .regular)], range: range)
        totalStatLabel.attributedText = attributedString
        
        self.statStore.stat = data.statData
    }
}

extension DetailStatTableViewCell {
    private func setAutoLayout() {
        addSubview(headerLabel)
        addSubview(totalStatLabel)
        addSubview(chartView!.view)

        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(16)
            make.height.equalTo(22)
        }
        
        totalStatLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.bottom.equalTo(headerLabel.snp.bottom)
            make.trailing.equalToSuperview().inset(16)
        }
        
        chartView!.view.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(15)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(189)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
