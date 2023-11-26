//
//  HighlightCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/24/23.
//

import UIKit

import SnapKit
import Then

final class HighlightCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HighlightCollectionViewCell"
    
    // MARK: - Properties
    
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    
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

extension HighlightCollectionViewCell {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        backgroundImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage.img14
        }
        
        titleLabel.do {
            $0.font = .carrotBody
            $0.textColor = .carrotWhite
            $0.numberOfLines = 2
            $0.text = "나의 취향 찾기(원데이 클래스)"
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        
        backgroundImageView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview()
        }
    }
    
}
