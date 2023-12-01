//
//  APIConstant.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation
import Moya

struct APIConstants{
    
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
    static let multipartFormData = "multipart/form"
    static let auth = "Authorization"
    static let refresh = "RefreshToken"
    static let fcm = "FcmToken"
    static let xClubId = "X-Club-Id"
    
}

extension APIConstants{
    
    static var noTokenHeader: Dictionary<String,String> {
        [contentType: applicationJSON]
    }
    
    static var yesTokenHeader:Dictionary<String,String> {
        [contentType: applicationJSON, xClubId: "1"]
    }
}
