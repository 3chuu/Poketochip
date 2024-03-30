//
//  PokemonListViewController.swift
//  Presentation
//
//  Created by 마경미 on 24.01.24.
//

import UIKit

import SnapKit

final class PokemonListViewController: BaseViewController<PokemonListViewModel> {
    private let searchView: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "‘디아루가’를 검색해보세요!"
        return searchBar
    }()
    
    // headerContentView + filterButton + typeStackView + typeScrollView를 다른 서브 뷰로 리팩토링하기
    private let headerContentView: UIView = {
        let view = UIView()
        view.layer.addBottomDivider()
        return view
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
    
//    private let typeStackView: UIStackView = {
//        let stackView = UIStackView()
//        return stackView
//    }()
//    
//    private let typeScrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        return scrollView
//    }()
    
    private let pokemonCollectionView: UICollectionView = {
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
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
    }
    
    override func configureUI() {
        super.configureUI()
    }
    
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubviews(searchView, headerContentView, pokemonCollectionView)
        headerContentView.addSubviews(filterButton)
        
        searchView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(38)
        }
        
        headerContentView.snp.makeConstraints {
            $0.top.equalTo(searchView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
//        filterButton.snp.makeConstraints {
//            
//        }
        
        pokemonCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerContentView.snp.bottom)
            $0.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailViewController(viewModel: DetailViewModel())
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
