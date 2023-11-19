//
//  UICollectionViewCell++.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit

public extension UICollectionViewCell {
    
    static var cellIdentifier  : String {
        return String(describing: self)
    }
}
