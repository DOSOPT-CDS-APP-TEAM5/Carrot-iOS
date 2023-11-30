//
//  ClubService.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/29/23.
//

import Foundation

import Moya
import UIKit

typealias DefaultClubService = BaseService<ClubAPI>

protocol ClubService {
    func getClubData(_ category: String?) async throws -> NetworkResult<Any>
}

extension DefaultClubService: ClubService {
    func getClubData(_ category: String?) async -> NetworkResult<Any> {
        await self.request(target: .getClubData(category), dataModel: [ClubDTO].self)
    }
}

