//
//  DetailStatTableViewCell.swift
//  Presentation
//
//  Created by 윤지호 on 1/19/24.
//

import UIKit

final class DetailStatTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "DetailStatCellIdentifier"
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
    
    private let chartView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    // MARK: Initialize Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ConfigureUI
    private func configureUI() {
        setHeaderLabel()
        setTotalStatLabel()
        setChartView()
    }
    
    func setData(_ data: SamplePokemonStat) {
        let attributedString = NSMutableAttributedString(string: data.totalStat)
        
        let range = (data.totalStat as NSString).range(of: "총합:")
        attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 14, weight: .regular)], range: range)
        totalStatLabel.attributedText = attributedString
    }
}

extension DetailStatTableViewCell {
    private func setHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(16)
            make.height.equalTo(22)
        }
    }
    private func setTotalStatLabel() {
        addSubview(totalStatLabel)
        totalStatLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.bottom.equalTo(headerLabel.snp.bottom)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setChartView() {
        addSubview(chartView)
        chartView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(15)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(189)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
