//
//  MainMoreClubCollectionFooterView.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainMoreClubCollectionFooterView: UICollectionReusableView {
    
    //MARK: - UI Components
    
    private let searchClubIcon = UIImageView(image: Image.searchclub)
    private let titleLabel = UILabel()
    private let navigationRightIcon = UIImageView(image: Image.navigationRight)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        titleLabel.do {
            $0.text = "모임 더 둘러보기"
            $0.textAlignment = .left
            $0.textColor = .carrotBlack
        }
    }
    
    private func hierarchy() {
        self.addSubviews(searchClubIcon, titleLabel, navigationRightIcon)
    }
    
    private func layout() {
        searchClubIcon.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(121)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(13)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(searchClubIcon.snp.trailing).offset(13)
            $0.centerY.equalToSuperview()
        }
        
        navigationRightIcon.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(2)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(16)
        }
    }
}
