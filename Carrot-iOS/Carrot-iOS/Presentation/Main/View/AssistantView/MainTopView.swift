//
//  MainTopView.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainTopView: UIView {
    
    // MARK: - UI Components
    
    private let neighborhoodLabel = UILabel()
    private let navigationUnderIcon = UIImageView(image: Image.navigationUnder)
    private let iconStackView = UIStackView()
    private let profileIcon = UIImageView(image: Image.profile)
    private let searchIcon = UIImageView(image: Image.search)
    private let alarmIcon = UIImageView(image: Image.alarm)
    
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
        neighborhoodLabel.do {
            $0.text = "동천동"
//            $0.font = .carrotButton
            $0.textColor = .carrotBlack
            $0.textAlignment = .left
        }
        
        iconStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 0
        }
    }
    
    private func hieararchy() {
        self.addSubviews(
            neighborhoodLabel,
            navigationUnderIcon,
            iconStackView
        )
        iconStackView.addArrangedSubViews(
            profileIcon,
            searchIcon,
            alarmIcon
        )
    }
    
    private func layout() {
        neighborhoodLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
            $0.leading.equalToSuperview().offset(15)
        }
        
        navigationUnderIcon.snp.makeConstraints {
            $0.top.equalTo(neighborhoodLabel)
            $0.leading.equalTo(neighborhoodLabel.snp.trailing).offset(1)
            $0.size.equalTo(18)
        }
        
        iconStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(108)
            $0.height.equalTo(36)
        }
    }
}





