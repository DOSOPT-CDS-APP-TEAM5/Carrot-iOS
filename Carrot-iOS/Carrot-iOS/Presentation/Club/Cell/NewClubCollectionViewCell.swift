//
//  NewClubCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class NewClubCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "NewClubCollectionViewCell"
    
    // MARK: - Properties
    
    private let clubImageView = UIImageView()
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
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

extension NewClubCollectionViewCell {
    
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
            $0.text = "주식 투자(트레이딩)"
        }
        
        bodyLabel.do {
            $0.font = .carrotBody
            $0.textColor = .grey400
            $0.text = "다양한 기법으로 투자(트레이딩)하는 관점"
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
            $0.text = "정자동"
        }
        
        tagView.do {
            $0.backgroundColor = .grey100
            $0.layer.cornerRadius = 3
        }
        
        tagLabel.do {
            $0.font = .carrotInfoNumber
            $0.textColor = .grey500
            $0.text = "투자/금융"
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(clubImageView, titleLabel, bodyLabel, locationView, tagView)
        
        clubImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(clubImageView.snp.trailing).offset(14)
            $0.top.equalTo(clubImageView.snp.top)
        }
        
        bodyLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
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
    
    func bindData(model: NewClubModel) {
        clubImageView.image = model.clubImg
        titleLabel.text = model.clubName
        bodyLabel.text = model.clubContent
        locationNameLabel.text = model.town
        tagLabel.text = model.category
    }
    
}
