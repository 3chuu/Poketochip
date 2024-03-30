//
//  GameInformationViewController.swift
//  Presentation
//
//  Created by cha_nyeong on 1/21/24.
//

import UIKit
import Common
import SnapKit
import SafariServices

public final class GameInformationViewController: BaseViewController<GameInformationViewModel>, UIScrollViewDelegate {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private let legendaryPokemonSectionView = LegendaryPokemonSectionView()
    private let characterAndPartnerSectionView = CharacterAndPartnerSectionView()
    private let regionSectionView = RegionSectionView()
    private let productInformationSectionView = ProductInformationSectionView()
    
    private let dividerView1: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.976, alpha: 1).cgColor
        return view
    }()
    
    private let dividerView2: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.976, alpha: 1).cgColor
        return view
    }()
    
    private let dividerView3: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.976, alpha: 1).cgColor
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    /// autoLayout 설정
    override func setAutoLayout() {
        super.setAutoLayout()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(legendaryPokemonSectionView,characterAndPartnerSectionView,regionSectionView,productInformationSectionView,dividerView1, dividerView2,dividerView3)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(productInformationSectionView.snp.bottom).offset(20)
        }
        
        legendaryPokemonSectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        dividerView1.snp.makeConstraints {
            $0.top.equalTo(legendaryPokemonSectionView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(10)
        }
        
        characterAndPartnerSectionView.snp.makeConstraints {
            $0.top.equalTo(dividerView1.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        dividerView2.snp.makeConstraints {
            $0.top.equalTo(characterAndPartnerSectionView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(10)
        }
        
        regionSectionView.snp.makeConstraints {
            $0.top.equalTo(dividerView2.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        dividerView3.snp.makeConstraints {
            $0.top.equalTo(regionSectionView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(10)
        }
        
        productInformationSectionView.snp.makeConstraints {
            $0.top.equalTo(dividerView3.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    /// 이외의 attributes 설정
    override func setAttributes() {
        super.setAttributes()
        
        navigationItem.title = "DP 디아루가"
        
    }
    
    override func bind() {
        legendaryPokemonSectionView.onTapDetail
            .bind { [weak self] in
                self?.pushToAppDetailViewController()
            }.disposed(by: disposeBag)
        
        productInformationSectionView.onTapSafariLink
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.openSafariViewController()
            }
            .disposed(by: disposeBag)
    }
    
    private func pushToAppDetailViewController() {
        let viewController = DetailViewController(viewModel: .init())
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// 관련링크 넘기기 but... UIButton 이외의 추가하려면 귀찮다..
extension GameInformationViewController: SFSafariViewControllerDelegate {
    func openSafariViewController() {
        guard let appleUrl = URL(string: "https://www.apple.com") else { return }
        
        let safariViewController = SFSafariViewController(url: appleUrl)
        safariViewController.delegate = self
        safariViewController.modalPresentationStyle = .automatic
        present(safariViewController, animated: true, completion: nil)
    }
}
