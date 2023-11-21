//
//  MainCategoryCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainCategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    let categoryLabel = UILabel()
    
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
        contentView.do {
            $0.makeCornerRound(radius: 20)
            $0.setBorder(borderWidth: 1, borderColor: .grey100)
        }
        
        categoryLabel.do {
            $0.font = .carrotBody()
            $0.textColor = .carrotBlack
            $0.textAlignment = .center
        }
    }
    
    private func hieararchy() {
        contentView.addSubviews(categoryLabel)
    }
    
    private func layout() {
        categoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}


