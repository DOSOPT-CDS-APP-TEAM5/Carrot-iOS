//
//  DetailBannerImageView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class DetailBannerImageView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let bannerImageView = UIImageView()
    
    
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
        bannerImageView.do {
            $0.image = .img27
        }
    }
    
    private func hieararchy() {
        self.addSubviews(bannerImageView)
    }
    
    private func layout() {
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}