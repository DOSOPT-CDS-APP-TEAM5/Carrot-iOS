//
//  FilterCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/24/23.
//

import UIKit

import SnapKit
import Then

final class FilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "FilterCollectionViewCell"
    
    // MARK: - Properties
    
    private let filterOneView = UIView()
    private let filterOneStackView = UIStackView()
    private let filterOneLabel = UILabel()
    private let filterOneImage = UIImageView()
    private let filterTwoView = UIView()
    private let filterTwoLabel = UILabel()
    
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

extension FilterCollectionViewCell {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        filterOneView.do {
            $0.layer.cornerRadius = 14
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.grey200.cgColor
        }
        
        filterOneStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 1
            $0.layer.cornerRadius = 3
        }
        
        filterOneLabel.do {
            $0.font = .carrotBody
            $0.textColor = .carrotBlack
            $0.text = "추천순"
        }
        
        filterOneImage.do {
            $0.image = .icNavigationUnder
        }
        
        filterTwoView.do {
            $0.layer.cornerRadius = 14
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.grey200.cgColor
        }
        
        filterTwoLabel.do {
            $0.font = .carrotBody
            $0.textColor = .carrotBlack
            $0.text = "가까운 동네만"
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(filterOneView, filterTwoView)
        
        filterOneView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
        
        filterOneView.addSubview(filterOneStackView)
        
        filterOneStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(7)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        [filterOneLabel, filterOneImage].forEach {
            filterOneStackView.addArrangedSubview($0)
        }
        
        filterOneImage.snp.makeConstraints {
            $0.size.equalTo(14)
        }
        
        filterTwoView.snp.makeConstraints {
            $0.leading.equalTo(filterOneView.snp.trailing).offset(8)
            $0.bottom.equalToSuperview()
        }
        
        filterTwoView.addSubview(filterTwoLabel)
        
        filterTwoLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(7)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
}
