//
//  DetailView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class DetailView: UIView {
    
    // MARK: - Properties
    
    
    
    // MARK: - UI Components
    
    private let pageScrollView = UIScrollView()
    private let scrollContentView = UIStackView()
    
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
        self.do {
            $0.backgroundColor = .carrotWhite
        }
    }
    
    private func hieararchy() {
        self.addSubviews(pageScrollView)
        
        pageScrollView.addSubviews(scrollContentView)
        
        scrollContentView.addArrangedSubViews(
            
        )
    }
    
    private func layout() {
        pageScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
}
