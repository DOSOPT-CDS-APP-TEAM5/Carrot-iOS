//
//  CustomCell.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/24/23.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    var label = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(label)
        setUI()
    }
    
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.label.textColor = isSelected ? .black : .lightGray
        }
    }
}

extension CustomCell {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        label.do {
            $0.text = "Tab"
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            $0.textColor = .lightGray
        }
    }
    
    private func setLayout() {
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}

