//
//  CustomTabBarController.swift
//  Common
//
//  Created by 윤지호 on 1/25/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

/// 홈텦으로 전환시키는 delegate입니다.
public protocol CustomTabBarDelegate: AnyObject {
    func popToHomeTab()
}

public final class CustomTabBarController: UITabBarController, UINavigationControllerDelegate {
    
    private var isViewAppeared: Bool = false
    
    weak public var backDelegate: CustomTabBarDelegate?
    
    // MARK: ViewControllers
    private var firstTabInfoVC: UINavigationController?
    private var secondTabFavoriteVC: UINavigationController?
    private var pokemonTabVC: UINavigationController?
    private var skillMachineTabVC: UINavigationController?
    private var toolTabVC: UINavigationController?
    private let emptyView: UIView = .init()
    
    // MARK: View
    private let firstTabBarItem: CutomTabBarItem = {
        let tabBarItem = CutomTabBarItem()
        tabBarItem.setItem(itemCase: .appInfo)
        return tabBarItem
    }()
    
    private let secondTabBarItem: CutomTabBarItem = {
        let tabBarItem = CutomTabBarItem()
        tabBarItem.setItem(itemCase: .favorite)
        return tabBarItem
    }()
    
    private let pokemonButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(resource: .pokeBooklet)
        
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        
        return button
    }()
    
    private let skillMachineButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(resource: .skillMachine)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        
        return button
    }()
    
    private let toolButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(resource: .toolBag)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        
        return button
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold, scale: .large)
        let image = UIImage(systemName: "arrow.uturn.left.circle.fill", withConfiguration: largeConfig)
        
        button.setImage(image, for: .normal)
        button.tintColor = .gray
        button.layer.cornerRadius = 30
        button.clipsToBounds = true

        return button
    }()
    
    // MARK: Rx Property
    private let disposeBag = DisposeBag()
    public let defaultIndexRelay: BehaviorRelay<Int> = .init(value: 0)
    private let isShowingButtonRelay: PublishRelay<Bool> = .init()
    
    // MARK: Initialize Property
    public required init(
        firstTabInfoVC: UINavigationController,
        secondTabFavoriteVC: UINavigationController,
        pokemonTabVC: UINavigationController,
        skillMachineTabVC: UINavigationController,
        toolTabVC: UINavigationController
    ) {
        self.firstTabInfoVC = firstTabInfoVC
        self.secondTabFavoriteVC = secondTabFavoriteVC
        self.pokemonTabVC = pokemonTabVC
        self.skillMachineTabVC = skillMachineTabVC
        self.toolTabVC = toolTabVC
        super.init(nibName: nil, bundle: nil)
        configureUI()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle Method
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isViewAppeared = true
    }
    
    private func configureUI() {
        setTabBarItem()
        setAutoLayout()
        setAttribute()
    }
}

extension CustomTabBarController {
    private func bind() {
        guard let tabBar = tabBar as? CustomTabBar else { return }
        tabBar.isShowingButtonRelay
            .bind(with: self) { owner, isShowing in
                owner.isShowingButtonRelay.accept(isShowing)
            }
            .disposed(by: disposeBag)
        
        isShowingButtonRelay
            .bind(with: self) { owner, isShowing in
                owner.translationButton(isShowing)
            }
            .disposed(by: disposeBag)
        
        defaultIndexRelay
            .bind(with: self) { owner, index in
                owner.setIsShowingButtonBoolean()
                owner.selectedIndex = index
            }
            .disposed(by: disposeBag)
        
        /// 각 button들의 touch event입니다.
        let firstTabGesture = UITapGestureRecognizer()
        firstTabBarItem.addGestureRecognizer(firstTabGesture)
        firstTabGesture.rx.event
            .map { _ in 0 }
            .bind(to: defaultIndexRelay)
            .disposed(by: disposeBag)
        
        let secondTabGesture = UITapGestureRecognizer()
        secondTabBarItem.addGestureRecognizer(secondTabGesture)
        secondTabGesture.rx.event
            .map { _ in 1 }
            .bind(to: defaultIndexRelay)
            .disposed(by: disposeBag)
        
        pokemonButton.rx.tap
            .map { _ in 2 }
            .bind(to: defaultIndexRelay)
            .disposed(by: disposeBag)
        
        skillMachineButton.rx.tap
            .map { _ in 3 }
            .bind(to: defaultIndexRelay)
            .disposed(by: disposeBag)
        
        toolButton.rx.tap
            .map { _ in 4 }
            .bind(to: defaultIndexRelay)
            .disposed(by: disposeBag)
        
        homeButton.rx.tap
            .bind(with: self) { owner, _ in
                owner.backDelegate?.popToHomeTab()
            }
            .disposed(by: disposeBag)
        
        homeButton.rx.tap
            .map { _ in 5 }
            .bind(to: defaultIndexRelay)
            .disposed(by: disposeBag)
    }
    
    private func setAutoLayout() {
        self.view.addSubview(firstTabBarItem)
        self.view.addSubview(secondTabBarItem)
        self.view.addSubview(pokemonButton)
        self.view.addSubview(skillMachineButton)
        self.view.addSubview(toolButton)
        self.view.addSubview(homeButton)
        
        firstTabBarItem.snp.makeConstraints {
            $0.centerY.equalTo(tabBar.snp.centerY)
            $0.leading.equalToSuperview()/*.inset(58)*/
            $0.height.equalTo(52)
            $0.width.equalTo(46 + 58 + 50)
        }
        
        secondTabBarItem.snp.makeConstraints {
            $0.centerY.equalTo(tabBar.snp.centerY)
            $0.trailing.equalToSuperview()/*.inset(58)*/
            $0.height.equalTo(52)
            $0.width.equalTo(46 + 58 + 50)
        }
        
        pokemonButton.snp.makeConstraints {
            $0.centerX.equalTo(tabBar.snp.centerX)
            $0.centerY.equalTo(tabBar.snp.centerY).offset(-26)
            $0.size.equalTo(10)
        }
        
        skillMachineButton.snp.makeConstraints {
            $0.centerX.equalTo(tabBar.snp.centerX)
            $0.centerY.equalTo(tabBar.snp.centerY).offset(-26)
            $0.size.equalTo(10)
        }
        
        toolButton.snp.makeConstraints {
            $0.centerX.equalTo(tabBar.snp.centerX)
            $0.centerY.equalTo(tabBar.snp.centerY).offset(-26)
            $0.size.equalTo(10)
        }
        
        homeButton.snp.makeConstraints {
            $0.centerX.equalTo(tabBar.snp.centerX)
            $0.centerY.equalTo(tabBar.snp.centerY).offset(-26)
            $0.size.equalTo(10)
        }
    }
    
    private func setAttribute() {
        moreNavigationController.viewControllers = []
        moreNavigationController.tabBarItem.title = ""
        
        emptyView.backgroundColor = .white
    }
}

extension CustomTabBarController {
    private func setTabBarItem() {
        
        self.setValue(CustomTabBar(frame: tabBar.frame), forKey: "tabBar")

        guard let firstVc = firstTabInfoVC,
              let secondVC = secondTabFavoriteVC,
              let pokemonTabVC = pokemonTabVC,
              let skillMachineTabVC = skillMachineTabVC,
              let toolTabVC = toolTabVC else { return }

        let viewControllers = [firstVc, secondVC, pokemonTabVC, skillMachineTabVC, toolTabVC]

        setViewControllers(viewControllers, animated: false)
    }
    
    private func translationButton(_ isShowing: Bool) {
        if isViewAppeared == false { return }
        
        if isShowing {
            self.pokemonButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX).offset(-90)
                $0.centerY.equalTo(self.tabBar.snp.centerY).offset(-70)
                $0.size.equalTo(70)
            }

            self.skillMachineButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX).offset(-35)
                $0.centerY.equalTo(self.tabBar.snp.centerY).offset(-117)
                $0.size.equalTo(70)
            }

            self.toolButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX).offset(35)
                $0.centerY.equalTo(self.tabBar.snp.centerY).offset(-117)
                $0.size.equalTo(70)
            }


            self.homeButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX).offset(90)
                $0.centerY.equalTo(self.tabBar.snp.centerY).offset(-70)
                $0.size.equalTo(70)
            }


        } else {
            self.pokemonButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX)
                $0.centerY.equalTo(self.tabBar.snp.centerY)
                $0.size.equalTo(1)
            }

            self.skillMachineButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX)
                $0.centerY.equalTo(self.tabBar.snp.centerY)
                $0.size.equalTo(1)
            }

            self.toolButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX)
                $0.centerY.equalTo(self.tabBar.snp.centerY)
                $0.size.equalTo(1)
            }

            self.homeButton.snp.remakeConstraints {
                $0.centerX.equalTo(self.tabBar.snp.centerX)
                $0.centerY.equalTo(self.tabBar.snp.centerY)
                $0.size.equalTo(1)
            }
        }
        
        UIView.animate(withDuration: 0.4, animations: self.view.layoutIfNeeded)
    }
}

extension CustomTabBarController {
    public func setIsShowingButtonBoolean() {
        guard let tabBar = tabBar as? CustomTabBar else { return }
        tabBar.isShowingButtonRelay.accept(false)
    }
}
