//
//  DetailNavigationConrollerBackButton.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 12/1/23.
//

import UIKit

import SnapKit
import Then

final class DetailNavigationConrollerBackButton: UIView {
    
    // MARK: - UI Components
    
    private let backButtonImage = UIImageView()
    
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
        backButtonImage.do {
            $0.image = Image.navigationLeft.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .carrotWhite
        }
    }
    
    private func hieararchy() {
        self.addSubview(backButtonImage)
    }
    
    private func layout() {
        backButtonImage.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.verticalEdges.equalToSuperview().inset(6)
        }
    }
}
