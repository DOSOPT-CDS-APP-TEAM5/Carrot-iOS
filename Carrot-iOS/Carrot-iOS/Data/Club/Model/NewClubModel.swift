//
//  NewClubModel.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 12/1/23.
//

import UIKit

struct NewClubModel {
    let clubImg: UIImage
    let clubName, clubContent, town, category: String
}

extension NewClubModel {
    static func newClubDummy() -> [NewClubModel] {
        return [
            NewClubModel(clubImg: Image.dummyClub5, clubName: "주식 투자(트레이딩)", clubContent: "다양한 기법으로 투자(트레이딩)하는 관점", town: "정자동", category: "투자/금융"), NewClubModel(clubImg: Image.dummyClub6, clubName: "음악회 / 전시회 동아리", clubContent: "음악회나 전시회 같이 보러 다닐 친구 구해요", town: "상현1동", category: "운동"),
            NewClubModel(clubImg: Image.dummyClub7, clubName: "광교 드림FC", clubContent: "매주 일요일 아침 광교 또는 인근 운동", town: "광교1동", category: "운동")
        ]
    }
}
