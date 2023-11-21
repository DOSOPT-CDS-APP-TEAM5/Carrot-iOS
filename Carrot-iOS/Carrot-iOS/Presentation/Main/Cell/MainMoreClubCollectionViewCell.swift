//
//  MainMoreClubCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainMoreClubCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let clubImageView = UIImageView()
    private let clubNameLabel = UILabel()
    
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
        clubImageView.do {
            $0.image = Image.dummyClub1
            $0.makeCornerRound(radius: 14)
            $0.contentMode = .scaleAspectFit
        }
        
        clubNameLabel.do {
            $0.text = "2030 세대만 \n등산모임"
            $0.textColor = .carrotBlack
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
    }
    
    private func hieararchy() {
        contentView.addSubviews(clubImageView, clubNameLabel)
    }
    
    private func layout() {
        clubImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(6)
            $0.height.equalTo(54)
        }
        
        clubNameLabel.snp.makeConstraints {
            $0.top.equalTo(clubImageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(64)
        }
    }
    
    func dataBind() {
        
    }
}

