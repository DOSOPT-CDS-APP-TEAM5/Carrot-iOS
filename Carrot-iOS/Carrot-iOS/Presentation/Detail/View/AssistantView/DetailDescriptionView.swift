//
//  DetailDescriptionView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class DetailDescriptionView: UIView {
    
    // MARK: - UI Components
    
    private let upperStackView = UIStackView()
    
    private let tagStackView = UIStackView()
    private let tag1 = DetailTagLabel()
    private let tag2 = DetailTagLabel()
    
    private let descriptionLabel = UILabel()
    
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
        upperStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
            $0.alignment = .fill
            $0.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        tagStackView.do {
            $0.axis = .horizontal
            $0.spacing = 9
            $0.alignment = .leading
        }
        
        tag1.do {
            $0.text = "운동"
            $0.font = .carrotBody
            $0.textColor = .grey500
            $0.makeCornerRound(radius: 4)
            $0.backgroundColor = .grey100
        }
        
        tag2.do {
            $0.text = "23~53세"
            $0.font = .carrotBody
            $0.textColor = .grey500
            $0.makeCornerRound(radius: 4)
            $0.backgroundColor = .grey100
        }
        
        descriptionLabel.do {
            $0.text = """
            우리 동네 테니스 모임(수지)
            상시회원 모집
            *20~50대 게임(주로 복식) 가능하신 분
            *주소가 용인에 거주 하시는 분
            *주 코트 위치: 신봉동(고가다리밑), 성복동(배수지코트), 풍덕천동(
            수지체육공원)
            *회비 없음 (유료 코트시 n/1)
            *회원간 예약 후 원하시는 시간에 자유롭게 운동 합니다
            """
            $0.numberOfLines = 0
            $0.font = .carrotBody
            $0.textColor = .carrotBlack
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        }
    }
    
    private func hieararchy() {
        self.addSubviews(upperStackView)
        
        upperStackView.addArrangedSubViews(
            tagStackView, descriptionLabel
        )
        
        tagStackView.addArrangedSubViews(
            tag1, tag2, UIView()   // 마지막 view 가 늘어나므로, 더미 뷰를 넣어줭주었음.
        )
    }
    
    private func layout() {
        upperStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
