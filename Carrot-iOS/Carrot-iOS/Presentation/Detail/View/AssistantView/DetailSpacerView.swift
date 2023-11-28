//
//  DetailSpacerView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class DetailSpacerView: UIView {
    
    // MARK: - UI Components
    
    private let spacerView = UIView()
    
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
        self.backgroundColor = .grey100
    }
    
    private func hieararchy() {
        self.addSubviews(spacerView)
    }
    
    private func layout() {
        spacerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(8)
        }
    }
}
