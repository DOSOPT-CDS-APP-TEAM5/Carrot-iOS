//
//  DetailForumView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class DetailForumView: UIView {
    
    // MARK: - UI Components
    
    private let totalStack = UIStackView()
    
    private let titleView = UILabel()
    private let spacer1 = UIView()
    private let forumLines = [0, 1, 2, 3, 4].map { _ in
        return DetailForumLineView()
    }
    
    private let spacer2 = UIView()
    
    private let moreEventButton = UIButton()
    private let buttonStackView = UIStackView()
    private let buttontitle = UILabel()
    private let buttonImage = UIImageView()
    
    
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
        totalStack.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.layoutMargins = UIEdgeInsets(top: 24, left: 15, bottom: 20, right: 15)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        titleView.do {
            $0.text = "게시판 48"
            $0.font = .carrotButton
            $0.textColor = .black
        }
        
        forumLines[0].do {
            $0.bindData(
                categoryText: "공지글",
                titleText: "요건 꼭 지켜주세요. 1. 운동 끝나고 쓰레기 치...",
                isNotice: true
            )
        }
        
        forumLines[1].do {
            $0.bindData(
                categoryText: "자유게시판",
                titleText: "내일 저녁 청계천에서 배드민턴 치실분 2분 ...",
                isNotice: false
            )
        }
        
        forumLines[2].do {
            $0.bindData(
                categoryText: "모임 후기",
                titleText: "오늘 너무 재밌었어요^^*~",
                isNotice: false
            )
        }
        
        forumLines[3].do {
            $0.bindData(
                categoryText: "자유게시판",
                titleText: "저는 탈퇴하겠습니다.",
                isNotice: false
            )
        }
        
        forumLines[4].do {
            $0.bindData(
                categoryText: "모임 후기",
                titleText: "11/14 모임 사진/배드민턴/닭계장에 소주",
                isNotice: false
            )
        }
        
        moreEventButton.do {
            $0.backgroundColor = .grey100
            $0.layer.cornerRadius = 6
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
        }
        
        buttontitle.do {
            $0.text = "전체보기"
            $0.font = .carrotSubtitle
            $0.textColor = .carrotBlack
        }
        
        buttonImage.do {
            $0.image = .icNavigationRight.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .carrotBlack
        }
        
    }
    
    private func hieararchy() {
        self.addSubviews(totalStack)
        
        totalStack.addArrangedSubViews(
            titleView, spacer1, forumLines[0], forumLines[1],
            forumLines[2], forumLines[3], forumLines[4], spacer2, moreEventButton
        )
        
        moreEventButton.addSubviews(
            buttonStackView
        )
        
        buttonStackView.addArrangedSubViews(
            buttontitle, buttonImage
        )
    }
    
    private func layout() {
        totalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        spacer1.snp.makeConstraints {
            $0.height.equalTo(16)
        }
        
        spacer2.snp.makeConstraints {
            $0.height.equalTo(17)
        }
        
        moreEventButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
