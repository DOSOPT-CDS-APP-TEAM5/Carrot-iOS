//
//  ClubTransform.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

extension ClubDTO {
    func toDomain() -> ClubModel {
        return ClubModel(
            clubId: clubId, participantCount: participantCount, clubCategoryContent: clubCategoryContent, clubName: clubName, clubImg: clubImg, town: town, participantsImg: participantsImg
        )
    }
}
