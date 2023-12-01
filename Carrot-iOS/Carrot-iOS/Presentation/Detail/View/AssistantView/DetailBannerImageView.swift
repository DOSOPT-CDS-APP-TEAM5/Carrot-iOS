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
    
    // MARK: - UI Components
    
    private let stackView = UIStackView()
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
        stackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
        }
//        bannerImageView.do {
//            $0.image = Image.dummyDetail1
//        }
        
    }
    
    private func hieararchy() {
        self.addSubviews(stackView)
        stackView.addArrangedSubview(bannerImageView)
    }
    
    private func layout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(stackView.snp.width).multipliedBy(0.5066)
        }
    }
    
    func bindData(data: DetailModel) {
        bannerImageView.kfSetImage(url: data.clubBackgroundImgURL)
    }
    
    func bindDummyData() {
        bannerImageView.image = Image.dummyDetail1
    }
}
