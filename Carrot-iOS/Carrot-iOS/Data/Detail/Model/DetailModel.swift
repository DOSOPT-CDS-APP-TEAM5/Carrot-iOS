//
//  DetailTableModel.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/23/23.
//

import Foundation

struct DetailModel {
    let clubName, clubImgURL, clubBackgroundImgURL, clubDescription: String
    let participantCount: Int
    let albumImgURLs: [String]
}

extension DetailModel {
    static var data: [DetailModel] = []
    
    
}
