//
//  DetailTransform.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

extension DetailDTO {
    func toDomain() -> DetailModel {
        return DetailModel(
            clubName: self.clubName,
            clubImgURL: self.clubImg,
            clubBackgroundImgURL: self.clubBackgroundImg,
            clubDescription: self.clubContent,
            participantCount: self.participantCount,
            albumImgURLs: self.albums.map{ $0.albumImg }
        )
    }
}
