//
//  ClubAPI.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/29/23.
//

import Foundation

import Moya
import UIKit

enum ClubAPI {
    case getClubData(_ category: String?)
}

extension ClubAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getClubData:
            return URLs.getMoreCategory
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getClubData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getClubData(let category):
            if let category = category {
                return .requestParameters(parameters: ["category" : category], encoding: URLEncoding.queryString)
            } else {
                return .requestPlain
            }
        }
    }
}




