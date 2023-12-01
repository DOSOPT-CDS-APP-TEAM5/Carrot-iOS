//
//  CustomTargetType.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 12/1/23.
//

import Foundation
import Moya

protocol CustomTargetType: TargetType{ }

extension CustomTargetType{
    
    var baseURL: URL {
        return URL(string: Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as! String)!
    }
    
    var headers: [String : String]? {
        return APIConstants.yesTokenHeader
    }
    
    var validationType: ValidationType {
        return .customCodes(Array(0...500).filter { $0 != 401 } )
    }
}
