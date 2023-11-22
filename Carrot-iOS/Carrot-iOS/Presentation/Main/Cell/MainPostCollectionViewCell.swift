//
//  MainPostCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainPostCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let contentStackView = UIStackView()
    
    private let categoryLabel = UILabel()
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let infoView = UIView()
    
    private let infoLabel = UILabel()
    
    private let likeStackView = UIStackView()
    private let likeIcon = UIImageView(image: Image.liked)
    private let likeCntLabel = UILabel()
    
    private let commentStackView = UIStackView()
    private let commentIcon = UIImageView(image: Image.comment)
    private let commentCntLabel = UILabel()
    
    private let separator = UIView()
    
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
        contentStackView.do {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 6
        }
        
        categoryLabel.do {
            $0.text = "동네 사건사고"
            $0.textColor = .grey500
            $0.font = .carrotTag
            $0.textAlignment = .center
            $0.backgroundColor = .grey100
        }
        
        titleLabel.do {
            $0.text = "강아지 잃어버리신 분 있나요?"
            $0.textColor = .carrotBlack
            $0.font = .carrotTitleMd
            $0.textAlignment = .left
        }
        
        subTitleLabel.do {
            $0.text = "하얀색 말티즈 강아지 은행 앞에서 발견했어요."
            $0.textColor = .grey400
            $0.font = .carrotBody
            $0.textAlignment = .left
        }
        
        infoLabel.do {
            $0.text = "동천동 · 1분 전 · 조회 22"
            $0.textColor = .grey400
            $0.font = .carrotBody
            $0.textAlignment = .left
        }
        
        likeCntLabel.do {
            $0.text = "1"
            $0.textColor = .carrotBlack
            $0.font = .carrotTitleMd
            $0.textAlignment = .left
        }
        
        commentCntLabel.do {
            $0.text = "3"
            $0.textColor = .carrotBlack
            $0.font = .carrotTitleMd
            $0.textAlignment = .left
        }
        
        likeStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        
        commentStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        
        separator.backgroundColor = .grey100
    }
    
    private func hieararchy() {
        contentView.addSubviews(categoryLabel, contentStackView, separator)
        contentStackView.addArrangedSubViews(
            titleLabel,
            subTitleLabel,
            infoView
        )
        
        infoView.addSubviews(infoLabel, likeStackView, commentStackView)
        likeStackView.addArrangedSubViews(likeIcon, likeCntLabel)
        commentStackView.addArrangedSubViews(commentIcon, commentCntLabel)
    }
    
    private func layout() {
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(categoryLabel.intrinsicContentSize.width + 12)
            $0.height.equalTo(categoryLabel.intrinsicContentSize.height + 6)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(6)
            $0.bottom.equalToSuperview().inset(18)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        likeStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(2)
            $0.trailing.equalToSuperview().inset(50)
            $0.width.equalTo(23)
        }
        
        commentStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(2)
            $0.width.equalTo(23)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        separator.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(1)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(contentStackView)
            $0.height.equalTo(1)
        }
    }
}



