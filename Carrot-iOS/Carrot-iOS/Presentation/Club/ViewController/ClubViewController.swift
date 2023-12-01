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
    
    private let backButton = UIBarButtonItem(image: UIImage.icNavigationLeft, style: .plain, target: self, action: nil)
    private let profileButton = UIBarButtonItem(image: UIImage(named: "ic_profile"), style: .plain, target: self, action: nil)
    private let alarmButton = UIBarButtonItem(image: UIImage(named: "ic_alarm"), style: .plain, target: self, action: nil)
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let searchBar = UISearchBar()
    private let clubTabmanViewController = ClubTabmanViewController()
    
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
            $0.searchTextField.font = .carrotTitleMd
            $0.searchTextField.textColor = .grey300
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
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.equalTo(1132)
        }
        
        [searchBar, clubTabmanViewController.view].forEach {
            contentView.addSubview($0)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        clubTabmanViewController.view.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setNavigation() {
        navigationItem.rightBarButtonItems = [alarmButton, profileButton]
        self.navigationController?.navigationBar.topItem?.title = "동천동 모임"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
