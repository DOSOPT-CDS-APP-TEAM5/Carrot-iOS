//
//  MainClubModel.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

struct MainClubModel {
    let image: UIImage
    let title: String
}

extension MainClubModel {
    static let clubList = [
        MainClubModel(image: Image.dummyMain1, title: "2030 세대만 등산모임"),
        MainClubModel(image: Image.dummyMain2, title: "부업, 투잡으로 모이는 ··"),
        MainClubModel(image: Image.dummyMain3, title: "팝송으로 영어 깨부시기"),
        MainClubModel(image: Image.dummyMain4, title: "4050 친구 어때?!"),
        MainClubModel(image: Image.dummyMain5, title: "광교산 등산, 운동, 산책"),
        MainClubModel(image: Image.dummyMain6, title: "동네 고전 문학 모여라"),
        MainClubModel(image: Image.dummyMain7, title: "동네 초딩 리코더 합주 ···")
    ]
}

