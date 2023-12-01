//
//  DetailView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class DetailView: UIView {

    // MARK: - UI Components
    
    private let pageScrollView = UIScrollView()
    private let scrollContentView = UIStackView()
    
    let bannerImageView = DetailBannerImageView()
    let topView = DetailTopView()
    let descriptionView = DetailDescriptionView()
    private let tabBar = DetailCustomTabBar()
    let albumView = DetailAlbumView()
    private let eventView = DetailEventView()
    private let forumView = DetailForumView()
    private let joinButton = DetailJoinButton()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hieararchy()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
        self.do {
            $0.backgroundColor = .carrotWhite
        }
        pageScrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = false
        }
        
        scrollContentView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.setCustomSpacing(-20, after: bannerImageView)
            $0.setCustomSpacing(26, after: topView)
            $0.setCustomSpacing(20, after: descriptionView)
        }
    }
    
    private func hieararchy() {
        self.addSubviews(pageScrollView, joinButton)
        
        pageScrollView.addSubviews(scrollContentView)
        
        scrollContentView.addArrangedSubViews(
            bannerImageView, topView, descriptionView, tabBar, albumView, DetailSpacerView(), eventView, DetailSpacerView(), forumView
        )
    }
    
    private func layout() {
        pageScrollView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalTo(joinButton.snp.top)
        }
        
        scrollContentView.snp.makeConstraints {
            $0.edges.equalTo(pageScrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
        }
        
        joinButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
