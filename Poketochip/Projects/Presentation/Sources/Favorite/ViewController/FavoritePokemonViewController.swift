//
//  FavoriteViewController.swift
//  App
//
//  Created by 마경미 on 17.01.24.
//

import UIKit

import Common

import SnapKit

final class FavoritePokemonViewController: BaseViewController<FavoritePokemonViewModel> {
    private let headerContentView: UIView = {
        let view = UIView()
        view.layer.addBottomDivider()
        return view
    }()
    
    private let segmentControl: UISegmentedControl = {
       let segmentControl = UISegmentedControl()
        segmentControl.insertSegment(withTitle: "DP 디아루가", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "전체 버전", at: 1, animated: true)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "GmarketSans-Bold", size: 16)
        button.setTitle("전체 특성", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.imageView?.tintColor = .black
        return button
    }()
    
    private let favoriteCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 8
        let itemWidth: CGFloat = (UIScreen.main.bounds.width / 3) - 9 * 2 - 16 * 2
        layout.itemSize = .init(width: itemWidth, height: itemWidth)
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PokemonListCollectionViewCell.self, forCellWithReuseIdentifier: PokemonListCollectionViewCell.cellId)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func bind() {
        super.bind()
        favoriteCollectionView.delegate = self
        favoriteCollectionView.dataSource = self
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubviews(headerContentView, favoriteCollectionView)
        headerContentView.addSubviews(segmentControl, filterButton)

        headerContentView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(116)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }
        
        filterButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(segmentControl.snp.bottom).offset(18)
            $0.height.equalTo(32)
        }
        
        favoriteCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerContentView.snp.bottom).offset(16)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func setAttributes() {
        super.setAttributes()
        
        navigationItem.title = "DP 디아루가"
    }
}

extension FavoritePokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PokemonCell.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCell.cellId, for: indexPath) as? PokemonListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setCell(data: PokemonCell.pokemons[indexPath.row])
        return cell
    }
}
