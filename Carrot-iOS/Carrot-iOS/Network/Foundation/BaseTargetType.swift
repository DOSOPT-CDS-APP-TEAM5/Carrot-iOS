//
//  BaseTargetType.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType{ }

extension BaseTargetType{
    
    var baseURL: URL {
        return URL(string: Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as! String)!
    }
    
    var headers: [String : String]? {
        return APIConstants.noTokenHeader
    }
    
    var validationType: ValidationType {
        return .customCodes(Array(0...500).filter { $0 != 401 } )
    }
}
