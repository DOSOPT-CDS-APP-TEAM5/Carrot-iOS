//
//  TownClubCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class TownClubCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TownClubCollectionViewCell"
    
    // MARK: - Properties
    
    private let clubImageView = UIImageView()
    private let titleLabel = UILabel()
    private let userImageView = UIImageView()
    private let numberLabel = UILabel()
    private let dotLabel = UILabel()
    private let statusLabel = UILabel()
    private let locationView = UIView()
    private let locationStackView = UIStackView()
    private let locationImageView = UIImageView()
    private let locationNameLabel = UILabel()
    private let tagView = UIView()
    private let tagLabel = UILabel()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension TownClubCollectionViewCell {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        clubImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.dummyClub1
        }
        
        titleLabel.do {
            $0.font = .carrotSubtitle
            $0.textColor = .carrotBlack
            $0.text = "새벽배드민턴 용인수지죽전아르피아"
        }
        
        userImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.dummyClub2
        }
        
        numberLabel.do {
            $0.font = .carrotBodyNumber
            $0.textColor = .grey500
            $0.text = "103명"
        }
        
        dotLabel.do {
            $0.font = .carrotBodyNumber
            $0.textColor = .black
            $0.text = "·"
        }
        
        statusLabel.do {
            $0.font = .carrotBodyNumber
            $0.textColor = .secondaryBlue
            $0.text = "방금 활동"
        }
        
        locationView.do {
            $0.backgroundColor = .grey100
            $0.layer.cornerRadius = 3
        }
        
        locationStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 1
        }
        
        locationImageView.do {
            $0.image = Image.location
        }
        
        locationNameLabel.do {
            $0.font = .carrotInfoNumber
            $0.textColor = .grey500
            $0.text = "풍덕천동"
        }
        
        tagView.do {
            $0.backgroundColor = .grey100
            $0.layer.cornerRadius = 3
        }
        
        tagLabel.do {
            $0.font = .carrotInfoNumber
            $0.textColor = .grey500
            $0.text = "운동"
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(clubImageView, titleLabel, userImageView, numberLabel, dotLabel, statusLabel, locationView, tagView)
        
        clubImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(clubImageView.snp.trailing).offset(14)
            $0.top.equalTo(clubImageView.snp.top)
        }
        
        userImageView.snp.makeConstraints {
            $0.leading.equalTo(clubImageView.snp.trailing).offset(14)
            $0.centerY.equalToSuperview()
        }
        
        
        numberLabel.snp.makeConstraints {
            $0.leading.equalTo(userImageView.snp.trailing).offset(4)
            $0.centerY.equalTo(clubImageView)
        }
        
        dotLabel.snp.makeConstraints {
            $0.leading.equalTo(numberLabel.snp.trailing)
            $0.centerY.equalTo(clubImageView)
        }
        
        statusLabel.snp.makeConstraints {
            $0.leading.equalTo(dotLabel.snp.trailing)
            $0.centerY.equalTo(clubImageView)
        }
        
        locationView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.bottom.equalTo(clubImageView)
        }
        
        locationStackView.addArrangedSubViews(locationImageView, locationNameLabel)
        
        locationView.addSubview(locationStackView)
        
        locationStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(2)
        }
        
        tagView.snp.makeConstraints {
            $0.leading.equalTo(locationView.snp.trailing).offset(3)
            $0.bottom.equalTo(clubImageView)
        }
        
        tagView.addSubview(tagLabel)
        
        tagLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(2)
        }
    }
    
}
