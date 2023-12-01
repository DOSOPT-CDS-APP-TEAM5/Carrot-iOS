//
//  SignUpAPI.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 12/1/23.
//

import Foundation

import Moya
import UIKit

enum SignUpAPI {
    case postSignUpData(nickname: String, information: String)
}

extension SignUpAPI: CustomTargetType {
    var path: String {
        switch self {
        case .postSignUpData:
            return URLs.postProfile
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postSignUpData:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .postSignUpData(nickname, information):
            let parameters: [String: String] = [
                "nickname": nickname,
                "information": information
            ]
            return .requestJSONEncodable(parameters)
        }
    }
}




