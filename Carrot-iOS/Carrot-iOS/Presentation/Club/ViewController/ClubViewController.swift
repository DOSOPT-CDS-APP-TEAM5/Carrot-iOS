//
//  ClubViewController.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/21/23.
//

import UIKit

import SnapKit
import Then

final class ClubViewController: UIViewController {
    
    // MARK: - Properties
    
    private let profileButton = UIBarButtonItem(image: UIImage(named: "ic_profile"), style: .plain, target: self, action: nil)
    private let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    private let alarmButton = UIBarButtonItem(image: UIImage(named: "ic_alarm"), style: .plain, target: self, action: nil)
    private let searchBar = UISearchBar()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setNavigation()
        setUI()
    }

}

// MARK: - Extensions

extension ClubViewController {
    
    // MARK: - @Functions
    
    // UI 세팅 작업
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        searchBar.do {
            $0.placeholder = "우리 동네 모임을 검색해보세요."
            $0.searchBarStyle = .minimal
            $0.searchTextField.backgroundColor = UIColor.grey100
            $0.setSearchFieldBackgroundImage(UIImage(), for: .normal)
            $0.searchTextField.layer.cornerRadius = 5
            $0.searchTextField.layer.masksToBounds = true
        }
        
        profileButton.do {
            $0.imageInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        }
        
        alarmButton.do {
            $0.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    private func setLayout() {
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
    }
    
    private func setNavigation() {
        navigationItem.rightBarButtonItems = [alarmButton, profileButton]
        self.navigationController?.navigationBar.topItem?.title = "동천동 모임"
        self.navigationController?.navigationBar.tintColor = .black
    }
    
}
