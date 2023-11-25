//
//  DetailEventView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class DetailEventView: UIView {
    
    // MARK: - UI Components
    
    private let totalStack = UIStackView()
    
    private let titleLabel = UILabel()
    
    private let eventDetail = UIView()
    private let dateStack = UIStackView()
    private let monthLabel = UILabel()
    private let dayLabel = UILabel()
    private let noticeIcon = UIImageView()
    private let noticeLabel = UILabel()
    private let stateLabel = UILabel()
    private let detailInfoStack = UIStackView()
    private let timeIcon = UIImageView()
    private let timeLabel = UILabel()
    private let personnelIcon = UIImageView()
    private let personnelLabel = UILabel()
    private let spacer = UIView()
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
            $0.alignment = .leading
            $0.spacing = 16
            $0.layoutMargins = UIEdgeInsets(top: 24, left: 15, bottom: 20, right: 15)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        titleLabel.do {
            $0.text = "일정 64"
            $0.font = .carrotButton
            $0.textColor = .black
        }
        
        dateStack.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 6
            $0.layoutMargins = UIEdgeInsets(top: 7, left: 8, bottom: 7, right: 8)
            $0.isLayoutMarginsRelativeArrangement = true
            $0.makeCornerRound(radius: 6)
            $0.backgroundColor = .grey100
        }
        
        monthLabel.do {
            $0.text = "11월"
            $0.font = .carrotBody
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
            $0.textColor = .grey500
        }
        
        dayLabel.do {
            $0.text = "8"
            $0.font = .carrotButton
            $0.textColor = .grey500
        }
        
        noticeIcon.do {
            $0.image = Image.alert
        }
        
        noticeLabel.do {
            $0.text = "모임에만 공개된 일정이에요."
            $0.font = .carrotTitleMd
            $0.setKerning(withPercentage: 1)
            $0.textColor = .grey400
        }
        
        stateLabel.do {
            $0.text = "모집중"
            $0.font = .carrotBody
            $0.textColor = .primaryButton
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        }
        
        detailInfoStack.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
            $0.setCustomSpacing(18, after: timeLabel)
        }
        
        timeIcon.do {
            $0.image = Image.time
        }
        
        timeLabel.do {
            $0.text = "오후 04:00"
            $0.font = .carrotBody
            $0.textColor = .grey500
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        }
        
        personnelIcon.do {
            $0.image = Image.personnel
        }
        
        personnelLabel.do {
            $0.text = "2/8명"
            $0.font = .carrotBody
            $0.textColor = .grey500
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
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
        self.addSubviews(
            totalStack
        )
        
        totalStack.addArrangedSubViews(
            titleLabel, eventDetail, moreEventButton
        )
        
        eventDetail.addSubviews(
            dateStack, noticeIcon, noticeLabel, stateLabel, detailInfoStack, spacer
        )
        
        dateStack.addArrangedSubViews(
            monthLabel, dayLabel
        )
        
        detailInfoStack.addArrangedSubViews(
            timeIcon, timeLabel, personnelIcon, personnelLabel
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
        
        monthLabel.snp.makeConstraints {
            $0.width.equalTo(22)
            $0.height.equalTo(13)
        }
        
        dayLabel.snp.makeConstraints {
            $0.height.equalTo(14)
        }
        
        dateStack.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        
        noticeIcon.snp.makeConstraints {
            $0.leading.equalTo(dateStack.snp.trailing).offset(8)
            $0.top.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints {
            $0.leading.equalTo(noticeIcon.snp.trailing).offset(4)
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        stateLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(9)
            $0.leading.equalTo(dateStack.snp.trailing).offset(8)
        }
        
        detailInfoStack.snp.makeConstraints {
            $0.top.equalTo(stateLabel.snp.bottom).offset(14)
            $0.leading.equalTo(dateStack.snp.trailing).offset(8)
        }
        
        timeLabel.snp.makeConstraints {
            $0.width.equalTo(66)
        }
        
        personnelLabel.snp.makeConstraints {
            $0.width.equalTo(66)
        }
        
        spacer.snp.makeConstraints {
            $0.top.equalTo(detailInfoStack.snp.bottom)
            $0.height.equalTo(4)
            $0.horizontalEdges.bottom.equalToSuperview()
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
