//
//  UIView+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit

extension UIView {
    
    public func addSubviews (_ views: UIView...){
        views.forEach { self.addSubview($0) }
    }
    
    func makeShadow (
        color: UIColor,
        offset : CGSize,
        radius : CGFloat,
        opacity : Float)
    {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    public func makeCornerRound (radius: CGFloat){
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func makeCornerRound (ratio : CGFloat) {
        layer.cornerRadius = self.frame.height / ratio
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    public func setBorder(borderWidth: CGFloat, borderColor: UIColor) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    /// UIView에 MaskLayer를 추가하는 함수
    /// - Parameter rect rect만큼의 범위만 보여지고 나머지는 mask됨
    public func roundedMask(rect: CGRect) {
        let path = CGMutablePath()
        path.addRoundedRect(in: rect, cornerWidth: 2, cornerHeight: 2)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        
        layer.mask = shapeLayer
    }
    
    public func setRoundCorners(corners: UIRectCorner, radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        var masked = CACornerMask()
        if corners.contains(.topLeft) { masked.insert(.layerMinXMinYCorner) }
        if corners.contains(.topRight) { masked.insert(.layerMaxXMinYCorner) }
        if corners.contains(.bottomLeft) { masked.insert(.layerMinXMaxYCorner) }
        if corners.contains(.bottomRight) { masked.insert(.layerMaxXMaxYCorner) }
        
        if corners.contains(.allCorners) {
            masked = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        self.layer.maskedCorners = masked
    }
    
    /// UIView를 UIImage로 변환해주는 함수
    /// - Parameter rect rect만큼의 범위만 UIImage로 변환, 지정해주지 않을 시 모든 범위를 변환
    public func asImage(rect: CGRect? = nil) -> UIImage {
        if let rect {
            let renderer = UIGraphicsImageRenderer(bounds: rect)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        }
    }
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }

    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        addSubview(border)
    }
}



