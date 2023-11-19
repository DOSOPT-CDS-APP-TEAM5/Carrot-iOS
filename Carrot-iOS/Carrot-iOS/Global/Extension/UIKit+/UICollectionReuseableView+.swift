//
//  UICollectionReuseableView+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit

public extension UICollectionReusableView{
    static var reuseCellIdentifier: String {
        return String(describing: self)
    }
}
