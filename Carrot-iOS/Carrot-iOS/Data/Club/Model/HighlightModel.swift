//
//  HighlightModel.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 12/1/23.
//

import UIKit

struct HighlightModel {
    let highlightImg: UIImage
    let title: String
}

extension HighlightModel {
    static func highlightDummy() -> [HighlightModel] {
        return [
            HighlightModel(highlightImg: Image.dummyClub4, title: "나의 취향 찾기(원데이 클래스)"),
            HighlightModel(highlightImg: Image.dummyClub8, title: "정자동 러닝 크루!"),
            HighlightModel(highlightImg: Image.dummyClub9, title: "영어 회화"),
            HighlightModel(highlightImg: Image.dummyClub9, title: "와인 함께 배워요"),
        ]
    }
}
