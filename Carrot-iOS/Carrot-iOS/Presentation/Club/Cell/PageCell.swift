//
//  PageCell.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/24/23.
//

import UIKit

import SnapKit
import Then

class PageCell: UICollectionViewCell {

    var label = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .gray
        setUI()
    }
}

extension PageCell {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        label.do {
            $0.textColor = .carrotBlack
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        }
    }
    
    private func setLayout() {
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
