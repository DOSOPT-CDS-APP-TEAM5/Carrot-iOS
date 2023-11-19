//
//  UIImageView+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit
import Kingfisher

extension UIImageView{
    public func kfSetImage(url : String?, defaultImage: UIImage? = nil){
        guard let url = url else {
            self.image = defaultImage
            return
        }
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}
