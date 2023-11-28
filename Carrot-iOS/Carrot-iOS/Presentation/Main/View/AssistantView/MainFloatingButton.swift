//
//  MainFloatingButton.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import UIKit

import SnapKit
import Then

final class MainFloatingButton: UIButton {
    
    //MARK: - UI Components
    
    let stackView = UIStackView()
    let plusIcon = UIImageView(image: Image.create)
    let writeLabel = UILabel()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hieararchy()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        self.do {
            $0.backgroundColor = .primaryButton
            $0.makeCornerRound(radius: 24)
            $0.isUserInteractionEnabled = true
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 3
            $0.isUserInteractionEnabled = false
            $0.backgroundColor = .clear
            $0.distribution = .equalSpacing
        }
        
        writeLabel.do {
            $0.text = "글쓰기"
            $0.textAlignment = .left
            $0.textColor = .carrotWhite
            $0.font = .carrotTitleMd
        }
    }
    
    private func hieararchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubViews(plusIcon, writeLabel)
    }
    
    private func layout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(13)
            $0.top.bottom.equalToSuperview().inset(14)
        }
    }
}
