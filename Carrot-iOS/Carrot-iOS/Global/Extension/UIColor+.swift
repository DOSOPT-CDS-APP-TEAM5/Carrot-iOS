//
//  UIColor+.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/20/23.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: alpha)
    }
}

//MARK: - Custom Color

extension UIColor{
    
    class var primaryButton: UIColor {
        return UIColor(r: 255, g: 111, b: 15)
    }
    
    class var primaryBackground: UIColor {
        return UIColor(r: 255, g: 235, b: 221)
    }
    
    class var secondaryBlue: UIColor {
        return UIColor(r: 91, g: 187, b: 238)
    }
    
    class var carrotBlack: UIColor {
        return UIColor(r: 33, g: 37, b: 41)
    }
    
    class var grey500: UIColor {
        return UIColor(r: 80, g: 81, b: 86)
    }
    
    class var grey400: UIColor {
        return UIColor(r: 134, g: 142, b: 150)
    }
    
    class var grey300: UIColor {
        return UIColor(r: 172, g: 176, b: 185)
    }
    
    class var grey200: UIColor {
        return UIColor(r: 221, g: 222, b: 227)
    }
    
    class var grey100: UIColor {
        return UIColor(r: 242, g: 243, b: 247)
    }
    
    class var carrotWhite: UIColor {
        return UIColor(r: 255, g: 255, b: 255)
    }
    
}
