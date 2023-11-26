//
//  ViewAllFooterView.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/24/23.
//

import UIKit

import SnapKit
import Then

final class ViewAllFooterView: UICollectionReusableView {
    
    static let identifier: String = "ViewAllFooterView"
    
    // MARK: - Properties
    
    private let viewAllView = UIView()
    private let viewAllStackView = UIStackView()
    private let viewAllLabel = UILabel()
    private let viewAllImageView = UIImageView()
    private let lineView = UIView()
    
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

extension ViewAllFooterView {
    
    // MARK: - @Functions
    
    // UI 세팅 작업
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        viewAllView.do {
            $0.backgroundColor = .grey100
            $0.layer.cornerRadius = 6
        }
        
        viewAllStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .equalSpacing
            $0.spacing = 6
        }
        
        viewAllLabel.do {
            $0.font = .carrotSubtitle
            $0.textColor = .carrotBlack
            $0.text = "전체보기"
        }
        
        viewAllImageView.do {
            $0.image = .icNavigationRight
        }
        
        lineView.do {
            $0.backgroundColor = .grey100
        }
    }
    
    private func setLayout() {
        addSubviews(viewAllView, lineView)
        
        viewAllView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(40)
        }
        
        viewAllView.addSubview(viewAllStackView)
        
        viewAllStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        viewAllStackView.addArrangedSubViews(viewAllLabel, viewAllImageView)
        
        viewAllImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(6)
        }
    }
    
}
