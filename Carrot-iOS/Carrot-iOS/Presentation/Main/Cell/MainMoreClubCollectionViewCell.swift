//
//  MainMoreClubCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainWeatherCollectionViewCell: UICollectionViewCell {
    
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
            $0.makeCornerRound(radius: 14)
            $0.contentMode = .scaleAspectFit
        }
        
        clubNameLabel.do {
            $0.textColor = .carrotBlack
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
    }
    
    private func hieararchy() {
        
    }
    
    private func layout() {
        
    }
    
    func dataBind() {
        
    }
}

