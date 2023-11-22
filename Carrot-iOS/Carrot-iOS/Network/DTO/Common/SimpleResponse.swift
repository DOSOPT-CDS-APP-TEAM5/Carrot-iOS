//
//  SimpleResponse.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

struct SimpleResponse: Codable {
    var status: Int
    var success: Bool
    var message: String?
}

