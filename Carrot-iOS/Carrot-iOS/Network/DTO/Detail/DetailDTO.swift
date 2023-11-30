//
//  DetailDTO.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

struct DetailDTO: Codable {
    let clubName, clubImg, clubBackgroundImg, clubContent: String
    let participantCount: Int
    let albums: [DetailAlbumsDTO]
}

struct DetailAlbumsDTO: Codable {
    let albumImg: String
}
