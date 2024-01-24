//
//  FilteringTypeSheetViewController.swift
//  App
//
//  Created by 마경미 on 17.01.24.
//

import UIKit

import SnapKit

final class FilteringPokemonTypeSheetViewController: BaseViewController<FilteringTypeViewModel> {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GmarketSans-Bold", size: 16)
        label.text = "전체 특성"
        return label
    }()
    
    private let typeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 9
        let itemWidth: CGFloat = (UIScreen.main.bounds.width / 3) - 9 * 2 - 16 * 2
        layout.itemSize = .init(width: itemWidth, height: itemWidth)
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PokemonTypeCollectionViewCell.self, forCellWithReuseIdentifier: PokemonTypeCollectionViewCell.cellId)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bind() {
        // rx로 이동하기
        typeCollectionView.delegate = self
        typeCollectionView.dataSource = self
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubviews(titleLabel, typeCollectionView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(16)
        }
        
        typeCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(16)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func setAttributes() {
        super.setAttributes()
    }
}

extension FilteringPokemonTypeSheetViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PokemonTypeCell.types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonTypeCollectionViewCell.cellId, for: indexPath) as? PokemonTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setCell(data: PokemonTypeCell.types[indexPath.row])
        return cell
    }
}
