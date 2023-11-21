//
//  MainMoreClubCollectionView.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainMoreClubCollectionView: UICollectionView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: .init())
        
        register()
        
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func register() {
        self.register(
            MainMoreClubCollectionViewCell.self,
            forCellWithReuseIdentifier: MainMoreClubCollectionViewCell.cellIdentifier
        )
    }
    
    private func style() {
        self.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(
                width: 66,
                height: 99
            )
            layout.minimumLineSpacing = 13
            layout.minimumInteritemSpacing = 0
            
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
    }
}





