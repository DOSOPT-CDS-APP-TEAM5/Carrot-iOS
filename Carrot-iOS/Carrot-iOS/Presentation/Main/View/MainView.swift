//
//  MainView.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainView: UIView {
    
    // MARK: - Properties
    
    private let topView = MainTopView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    let moreClubView = MainMoreClubCollectionView()
    private let categoryView = UIView()
    private let postView = UIView()
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hieararchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
        self.backgroundColor = .carrotWhite
        
        scrollView.do {
            $0.alwaysBounceVertical = true
        }
        moreClubView.backgroundColor = .yellow
        categoryView.backgroundColor = .red
        postView.backgroundColor = .blue
    }
    
    private func hieararchy() {
        self.addSubviews(topView, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            moreClubView,
            categoryView,
            postView
        )
    }
    
    private func layout() {
        topView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(5)
            $0.width.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView.frameLayoutGuide).priority(.low)
        }
        
        moreClubView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(50)
            $0.width.equalToSuperview()
            $0.height.equalTo(163)
        }
        categoryView.snp.makeConstraints {
            $0.top.equalTo(moreClubView.snp.bottom).offset(8)
            $0.width.equalToSuperview()
            $0.height.equalTo(349)
        }
        postView.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
}

