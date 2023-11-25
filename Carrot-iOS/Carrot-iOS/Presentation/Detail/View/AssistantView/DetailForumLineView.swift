//
//  DetailForumLineView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class DetailForumLineView: UIView {
    
    // MARK: - UI Components
    
    private let totalStack = UIStackView()
    private let categoryLabel = UILabel()
    private let titleLabel = UILabel()
    private let likeStack = UIStackView()
    private let likeIcon = UIImageView()
    private let likeCountLabel = UILabel()
    
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
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }
        
        categoryLabel.do {
            $0.text = "공지글"
            $0.font = .carrotBody
            $0.textColor = .primaryButton
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        }
        
        titleLabel.do {
            $0.text = "요건 꼭 지켜주세요. 1. 운동 끝나고 쓰레기 치..."
            $0.font = .carrotBody
            $0.textColor = .black
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        }
        
        likeStack.do {
            $0.axis = .horizontal
            $0.spacing = 3
        }
        
        likeIcon.do {
            $0.image = Image.likedCircle
        }
        
        likeCountLabel.do {
            $0.text = "2"
            $0.font = .carrotBody
            $0.textColor = .grey500
            $0.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        }
    }
    
    private func hieararchy() {
        self.addSubviews(totalStack)
        
        totalStack.addArrangedSubViews(
            categoryLabel, titleLabel, likeStack
        )
        
        likeStack.addArrangedSubViews(
            likeIcon, likeCountLabel
        )
    }
    
    private func layout() {
        totalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(19)
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(212)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.width.equalTo(7)
            $0.height.equalTo(18)
        }
    }
    
    func bindData(categoryText: String, titleText: String, isNotice: Bool) {
        self.categoryLabel.text = categoryText
        self.categoryLabel.textColor = isNotice ? .primaryButton : .grey400
        self.titleLabel.text = titleText
        self.categoryLabel.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        self.titleLabel.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
        self.likeCountLabel.setLineSpacingAndKerning(spacingPercentage: 160, kerningPercentage: -4.3)
    }
}
