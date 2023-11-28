//
//  DetailJoinButton.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class DetailJoinButton: UIView {
    
    // MARK: - UI Components
    
    private let joinButton = UIButton()
    
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
        self.backgroundColor = .carrotWhite
        
        joinButton.do {
            $0.backgroundColor = .primaryButton
            $0.makeCornerRound(radius: 6)
            $0.setTitle("모임 가입하기", for: .normal)
            $0.titleLabel?.font = .carrotButton
            $0.setTitleColor(.carrotWhite, for: .normal)
        }
    }
    
    private func hieararchy() {
        self.addSubviews(joinButton)
    }
    
    private func layout() {
        self.snp.makeConstraints {
            $0.height.equalTo(76)
        }
        
        joinButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(11)
            $0.top.equalToSuperview().inset(12)
        }
    }
}
