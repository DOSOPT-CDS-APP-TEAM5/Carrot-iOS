//
//  DetailAlbumView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/24/23.
//

import UIKit

import SnapKit
import Then

final class DetailAlbumView: UIView {
    // MARK: - Properties
    
    
    
    // MARK: - UI Components
    
    private let totalStack = UIStackView()
    private let upperStack = UIStackView()
    private let lowerStack = UIStackView()
    private let titleLabel = PaddingLabel(padding: UIEdgeInsets(top: 20, left: 15, bottom: 14, right: 15) )
    private let imageViews: [UIImageView] = [1, 2, 3, 4, 5].map { _ in return UIImageView() }
    private let moreButton = UIButton()
    private let morePictrueButton = UIImageView()
    
    
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
        totalStack.do {
            $0.axis = .vertical
            $0.spacing = 2
            $0.alignment = .fill
        }
        
        titleLabel.do {
            $0.text = "앨범 5"
            $0.textColor = .carrotBlack
            $0.font = .carrotButton
        }
        
        [upperStack, lowerStack].forEach {
            $0.axis = .horizontal
            $0.spacing = 2
            $0.distribution = .fillEqually
        }
        
        moreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.grey300, for: .normal)
            $0.titleLabel?.font = .carrotTitleMd
            $0.titleLabel?.setKerning(withPercentage: 1)
            $0.backgroundColor = .grey100
        }
        
        morePictrueButton.do {
            $0.image = Image.gallery
        }
    }
    
    private func hieararchy() {
        self.addSubviews(totalStack)
        
        totalStack.addArrangedSubViews(
            titleLabel, upperStack, lowerStack
        )
        
        upperStack.addArrangedSubViews(
            imageViews[0], imageViews[1], imageViews[2]
        )
        
        lowerStack.addArrangedSubViews(
            imageViews[3], imageViews[4], moreButton
        )
        
        imageViews[3].addSubviews(
            morePictrueButton
        )
    }
    
    private func layout() {
        totalStack.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
        
        upperStack.snp.makeConstraints {
            $0.height.equalTo(upperStack.snp.width).multipliedBy(1.1/3)
        }
        
        lowerStack.snp.makeConstraints {
            $0.height.equalTo(upperStack.snp.width).multipliedBy(1.1/3)
        }
        
        morePictrueButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(9)
        }
    }
    
    func bindData(data: DetailModel) {
        for i in 0..<imageViews.count {
            imageViews[i].kfSetImage(url: data.albumImgURLs[i])
        }
    }
    
    func bindDummyData() {
        let images: [UIImage] = [
            Image.dummyDetail3, Image.dummyDetail4, Image.dummyDetail5, Image.dummyDetail6, Image.dummyDetail7
        ]
        for i in 0..<images.count {
            imageViews[i].image = images[i]
        }
    }
}
