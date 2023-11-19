//
//  UINavagationController+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit
extension UINavigationController{
    
    var previousViewController: UIViewController? {
        let count = self.viewControllers.count
        return count < 2 ? self : self.viewControllers[count - 2]
    }
}
