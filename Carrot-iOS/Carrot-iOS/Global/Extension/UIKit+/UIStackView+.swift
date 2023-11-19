//
//  UIStackView+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit

extension UIStackView{
    
    public func addArrangedSubViews(_ views: UIView...){
        views.forEach {  self.addArrangedSubview($0) }
    }
    
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
