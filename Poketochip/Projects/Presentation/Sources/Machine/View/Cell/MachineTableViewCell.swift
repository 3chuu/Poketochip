//
//  MachineTableViewCell.swift
//  Presentation
//
//  Created by cha_nyeong on 2/11/24.
//

import UIKit
import Common
import SnapKit

final class MachineTableViewCell: UITableViewCell {
    
    let machine: Machine = Machine(
        generation: 3,
        machineId: 1,
        machineName: "힘껏펀치",
        machineType: PokemonType.fighting,
        machineSort: .physics,
        power: 150,
        hit: 100,
        pp: 20,
        description: "정신력을 높여 펀치를 날린다. 기술을 쓰기 전에 공격을 받으면 실패한다.",
        isVision: false
    )
    
    static let cellId: String = "MachineCellIdentifier"
    
    // MARK: Views
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "기술명"
        label.font = UIFont(name: "GmarketSans-Medium", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let typeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = CommonAsset.fightingIcon.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let sortLabel: UILabel = {
        let label = UILabel()
        label.text = "특수"
        label.font = UIFont(name: "GmarketSans-Medium", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let powerLabel: UILabel = {
        let label = UILabel()
        label.text = "150"
        label.font = UIFont(name: "GmarketSans-Medium", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let hitLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.font = UIFont(name: "GmarketSans-Medium", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let ppLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.font = UIFont(name: "GmarketSans-Medium", size: 16)
        label.textAlignment = .left
        return label
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
        setAutoLayout()
    }
    
    private func setAutoLayout() {
        addSubviews(nameLabel, powerLabel, hitLabel, ppLabel, typeImage, sortLabel)
        
        ppLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().offset(11)
            $0.trailing.equalToSuperview()
        }
        
        hitLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().offset(11)
            $0.leading.equalTo(ppLabel.snp.leading).offset(-40)
        }
        
        powerLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().offset(11)
            $0.leading.equalTo(hitLabel.snp.leading).offset(-40)
        }
        
        sortLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().offset(11)
            $0.trailing.equalTo(powerLabel.snp.leading).offset(-12)
        }
        
        typeImage.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().offset(11)
            $0.trailing.equalTo(sortLabel.snp.leading).offset(-12)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().offset(11)
            $0.leading.equalToSuperview()
            $0.trailing.lessThanOrEqualTo(typeImage.snp.leading).offset(12)
        }
    }
    
    func setData(machine: Machine) {
        nameLabel.text = machine.isVision ? "비전)" + machine.machineName : machine.machineName
        typeImage.image = machine.machineType.symbolImage
        sortLabel.text = machine.machineSort.rawValue
        powerLabel.text = "\(machine.power)"
        hitLabel.text = "\(machine.hit)"
        ppLabel.text = "\(machine.pp)"
    }
}
