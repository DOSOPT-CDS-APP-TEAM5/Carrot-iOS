//
//  DetailTopView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class DetailTopView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let upperStackView = UIStackView()
    
    private let firstStackView = UIStackView()
    
    
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
        upperStackView.do {
            $0.axis = .vertical
            $0.spacing = 16
        }
        
        firstStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
    }
    
    private func hieararchy() {
        self.addSubviews(upperStackView)
    }
    
    private func layout() {
        upperStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
