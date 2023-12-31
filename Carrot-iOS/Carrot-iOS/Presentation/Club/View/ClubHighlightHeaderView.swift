//
//  ClubHighlightHeaderView.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/23/23.
//

import UIKit

final class ClubHighlightHeaderView: UIView {

    // MARK: - Properties
    
    private let titleLabel = UILabel()
    
    // MARK: - View Life Cycle
    
    init() {
        super.init(frame: .zero)
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension ClubHighlightHeaderView {
    
    // MARK: - @Functions
    
    // UI 세팅 작업
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .carrotTitleBd
            $0.text = "모임 하이라이트"
        }
    }
    
    private func setLayout() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(15)
        }
    }
    
}
