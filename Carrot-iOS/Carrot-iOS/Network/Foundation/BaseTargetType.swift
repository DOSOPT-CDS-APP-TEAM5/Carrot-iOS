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
        return URL(fileURLWithPath: "")
//        return URL(string: Config.baseURL)! -> 나중에 정해지면 반영할게욤!
    }
    
    var headers: [String : String]? {
        return APIConstants.noTokenHeader
    }
    
    var validationType: ValidationType {
        return .customCodes(Array(0...500).filter { $0 != 401 } )
    }
}
