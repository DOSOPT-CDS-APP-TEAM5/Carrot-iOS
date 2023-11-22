//
//  MainMoreClubCollectionFooterView.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainMoreClubFooterView: UIView {
    
    //MARK: - UI Components
    
    private let separator = UIView()
    private let separator2 = UIView()
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
        separator.backgroundColor = .grey100
        separator2.backgroundColor = .grey100
        
        titleLabel.do {
            $0.text = "모임 더 둘러보기"
            $0.textAlignment = .left
            $0.textColor = .carrotBlack
            $0.font = .carrotSubtitle
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            separator,
            searchClubIcon,
            titleLabel,
            navigationRightIcon,
            separator2
        )
    }
    
    private func layout() {
        separator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        searchClubIcon.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(121)
            $0.top.equalToSuperview().offset(16)
            $0.width.equalTo(16)
            $0.height.equalTo(13)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(searchClubIcon.snp.trailing).offset(13)
            $0.top.equalToSuperview().offset(16)
        }
        
        navigationRightIcon.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(2)
            $0.top.equalToSuperview().offset(16)
            $0.size.equalTo(16)
        }
        
        separator2.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.width.equalToSuperview()
            $0.height.equalTo(8)
        }
    }
}
