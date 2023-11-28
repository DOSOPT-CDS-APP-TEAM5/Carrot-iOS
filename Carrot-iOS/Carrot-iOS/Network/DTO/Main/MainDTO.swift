//
//  MainDTO.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

struct MainDTO: Codable {
    let lifeID: Int
    let lifeCategoryContent, lifeTitle, lifeContent, contentInformation: String
    let likeCount, commentCount: Int

    enum CodingKeys: String, CodingKey {
        case lifeID = "lifeId"
        case lifeCategoryContent, lifeTitle, lifeContent, contentInformation, likeCount, commentCount
    }
}
