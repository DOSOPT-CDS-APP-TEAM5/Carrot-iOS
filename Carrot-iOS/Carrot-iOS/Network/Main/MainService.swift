//
//  MainService.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/27.
//

import Foundation

import Moya
import UIKit

typealias DefaultMainService = BaseService<MainAPI>

protocol MainService {
    func getMainData() async throws -> NetworkResult<Any>
}

extension DefaultMainService: MainService {
    func getMainData() async -> NetworkResult<Any> {
        await self.request(target: .getMainData, dataModel: [MainDTO].self)
    }
}
