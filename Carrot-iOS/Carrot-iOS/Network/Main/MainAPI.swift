//
//  MainAPI.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/27.
//

import Foundation

import Moya
import UIKit

enum MainAPI {
    case getMainData(_ category: String?)
}

extension MainAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getMainData:
            return URLs.getCategory
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMainData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMainData(let category):
            if let category = category {
                return .requestParameters(parameters: ["category" : category], encoding: URLEncoding.queryString)
            } else {
                return .requestPlain
            }
        }
    }
}



