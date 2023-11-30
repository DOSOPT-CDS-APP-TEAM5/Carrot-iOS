//
//  DetailAPI.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/30/23.
//

import Foundation

import Moya
import UIKit

enum DetailAPI {
    case getDetailData(_ clubID: Int)
}

extension DetailAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getDetailData(let clubID):
            return URLs.getClub + "/\(clubID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDetailData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getDetailData:
            return .requestPlain
        }
    }
}



