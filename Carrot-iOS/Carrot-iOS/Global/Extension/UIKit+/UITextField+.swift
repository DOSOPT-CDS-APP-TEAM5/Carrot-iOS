//
//  UITextField+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit

extension UITextField {
    
    func addLeftPadding(inset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(inset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
    public func setPlaceholderColor(text: String? = nil, color: UIColor) {
        if let string = text {
            attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
        } else {
            guard let fullText = self.placeholder else { return }
            attributedPlaceholder = NSAttributedString(string: fullText, attributes: [.foregroundColor: color])
        }
        
    }
    
}



