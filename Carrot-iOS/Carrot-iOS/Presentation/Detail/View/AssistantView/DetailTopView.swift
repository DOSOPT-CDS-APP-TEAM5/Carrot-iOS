//
//  DetailTopView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class DetailTopView: UIView {
    
    // MARK: - UI Components
    
    private let upperStackView = UIStackView()
    
    private let firstStackView = UIStackView()
    private let thumbnailView = UIImageView()
    private let innerStackView = UIStackView()
    private let shareButton = UIButton()
    private let moreButton = UIButton()
    
    private let titleView = UILabel()
    
    private let moreMemberButton = UIButton()
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
        upperStackView.do {
            $0.axis = .vertical
            $0.spacing = 16
            $0.alignment = .fill
            $0.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        firstStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .bottom
        }
        
        thumbnailView.do {
            $0.image = Image.dummyDetail2
            $0.makeCornerRound(radius: 14)
        }
        
        innerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 9
        }
        
        shareButton.do {
            $0.setImage(Image.shareCircle, for: .normal)
        }
        moreButton.do {
            $0.setImage(Image.meatballCircle, for: .normal)
        }
        
        titleView.do {
            $0.text = "[수지] 테니스 치실 동네분들 모십니다 ^^"
            $0.font = .carrotHead
            $0.textColor = .carrotBlack
        }
        
        moreMemberButton.do {
            $0.backgroundColor = .primaryBackground
            $0.layer.cornerRadius = 6
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
        }
        
        buttontitle.do {
            $0.text = "40명의 멤버 보기"
            $0.font = .carrotSubtitle
            $0.textColor = .primaryButton
        }
        
        buttonImage.do {
            $0.image = Image.navigationRight?.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .primaryButton
        }
        
    }
    
    private func hieararchy() {
        self.addSubviews(upperStackView)
        
        upperStackView.addArrangedSubViews(
            firstStackView, titleView, moreMemberButton
        )
        
        firstStackView.addArrangedSubViews(
            thumbnailView, innerStackView
        )
        
        innerStackView.addArrangedSubViews(
            shareButton, moreButton
        )
        
        moreMemberButton.addSubviews(
            buttonStackView
        )
        
        buttonStackView.addArrangedSubViews(
            buttontitle, buttonImage
        )
    }
    
    private func layout() {
        upperStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        moreMemberButton.snp.makeConstraints {
            $0.height.equalTo(41)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func bindData(data: DetailModel) {
        thumbnailView.kfSetImage(url: data.clubImgURL)
        titleView.text = data.clubName
        buttontitle.text = "\(data.participantCount)명의 멤버 보기"
    }
}
