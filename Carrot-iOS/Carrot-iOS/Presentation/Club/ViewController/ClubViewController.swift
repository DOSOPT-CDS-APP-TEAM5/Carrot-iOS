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
    
    let searchBar = UISearchBar()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
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
    }
    
    private func setLayout() {}
    
}
