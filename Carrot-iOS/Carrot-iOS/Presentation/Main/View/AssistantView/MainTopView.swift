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
    private let navigationUnderIcon = UIImageView()
    
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
            $0.font = .carrotButton
        }
        navigationUnderIcon.image = Image.navigationUnder
    }
    
    private func hieararchy() {
        
    }
    
    private func layout() {
    }
}





