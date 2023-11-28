//
//  FarClubFooterView.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/24/23.
//

import UIKit

import SnapKit
import Then

final class FarClubFooterView: UICollectionReusableView {
    
    static let identifier: String = "FarClubFooterView"
    
    // MARK: - Properties
    
    private let lineView = UIView()
    private let farClubView = UIView()
    private let farClubLabel = UILabel()
    private let farClubButton = UIButton()
    
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

extension FarClubFooterView {
    
    // MARK: - @Functions
    
    // UI 세팅 작업
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        lineView.do {
            $0.backgroundColor = .grey100
        }
        
        farClubView.do {
            $0.backgroundColor = .grey100
            $0.layer.cornerRadius = 6
        }
        
        farClubLabel.do {
            $0.font = .carrotBody
            $0.textColor = .carrotBlack
            $0.text = "원하는 모임이 없나요?"
        }
        
        farClubButton.do {
            $0.setTitle("먼 동네의 모임보기", for: .normal)
            $0.setTitleColor(UIColor.grey500, for: .normal)
            $0.titleLabel?.font = .carrotBody
            $0.setUnderline()
        }
    }
    
    private func setLayout() {
        addSubviews(lineView, farClubView)
        
        lineView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(6)
        }
        
        farClubView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(37)
        }
        
        farClubView.addSubviews(farClubLabel, farClubButton)
        
        farClubLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(17)
            $0.centerY.equalToSuperview()
        }
        
        farClubButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(17)
            $0.centerY.equalToSuperview()
        }
    }
}
