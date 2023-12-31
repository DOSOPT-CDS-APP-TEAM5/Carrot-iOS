//
//  MainTransform.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

extension MainDTO {
    func toDomain() -> MainModel {
        return MainModel(
            id: lifeID,
            tag: lifeCategoryContent,
            title: lifeTitle,
            content: lifeContent,
            contentInformation: contentInformation,
            likeCnt: likeCount,
            commentCnt: commentCount
        )
    }
}

