//
//  MainCategoryModel.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import Foundation

struct MainCategoryModel {
    let text: String
}

extension MainCategoryModel {
    static let categoryList = [
        MainCategoryModel(text: "주제"),
        MainCategoryModel(text: "동네백과"),
        MainCategoryModel(text: "동네질문"),
        MainCategoryModel(text: "동네 사건사고"),
        MainCategoryModel(text: "생활정보"),
        MainCategoryModel(text: "취미생활")
    ]
}
