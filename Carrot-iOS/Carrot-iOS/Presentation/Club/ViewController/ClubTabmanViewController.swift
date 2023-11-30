//
//  ClubTabmanViewController.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/23/23.
//

import UIKit

import SnapKit
import Then
import Tabman
import Pageboy

final class ClubTabmanViewController: TabmanViewController {
    
    // MARK: - Properties
    
    let barView = UIView()
    let botttomLineView = UIView()
    let bar = TMBar.ButtonBar()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "게시판"
        setUI()
        self.isScrollEnabled = false
        self.dataSource = self
    }

}

// MARK: - Extensions

extension ClubTabmanViewController {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
        barView.do {
            $0.backgroundColor = .white
        }
        
        botttomLineView.do {
            $0.backgroundColor = .grey200
        }
        
        bar.do {
            $0.layout.transitionStyle = .snap
            $0.layout.contentMode = .fit
            $0.backgroundView.style = .custom(view: barView)
            $0.buttons.customize { (button) in
                button.selectedTintColor = .carrotBlack
                button.tintColor = .grey400
            }
            $0.indicator.tintColor = .carrotBlack
            $0.indicator.weight = .custom(value: 1.0)
            addBar($0, dataSource: self, at: .top)
        }
        
    }
    
    private func setLayout() {
        
        view.addSubviews(botttomLineView)
        
        botttomLineView.snp.makeConstraints {
            $0.top.equalTo(bar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
    }
    
}

extension ClubTabmanViewController: PageboyViewControllerDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 2
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        
        switch index {
        case 0:
            return AllClubViewController(
                clubRepository: DefaultClubRepository(
                    clubService: DefaultClubService()
                ))
        default:
            return MyClubViewController()
        }
        
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}

extension ClubTabmanViewController: TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "전체 모임")
        default:
            return TMBarItem(title: "나의 모임 일정")
        }
    }
    
}

