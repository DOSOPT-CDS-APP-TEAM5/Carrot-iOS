//
//  ClubDTO.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

struct ClubDTO: Codable {
    let clubId, participantCount: Int
    let clubCategoryContent, clubName, clubImg, town, participantsImg: String
}
