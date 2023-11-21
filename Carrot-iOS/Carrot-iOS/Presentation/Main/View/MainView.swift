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
    let moreClubFooterView = MainMoreClubFooterView()
    let categoryView = MainCategoryCollectionView()
    let postView = MainPostCollectionView()
    private let tabbarView = UIImageView(image: Image.tabbar)
    
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
    }
    
    private func hieararchy() {
        self.addSubviews(topView, scrollView, tabbarView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            moreClubView,
            moreClubFooterView,
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
            $0.bottom.equalToSuperview().inset(85)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        moreClubView.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        moreClubFooterView.snp.makeConstraints {
            $0.top.equalTo(moreClubView.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        categoryView.snp.makeConstraints {
            $0.top.equalTo(moreClubFooterView.snp.bottom)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        postView.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
             $0.height.equalTo(1270)
            $0.bottom.equalToSuperview().offset(-15) // 하단 여백 추가
        }
        
        tabbarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(85)
        }
    }
}
