//
//  DetailService.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/30/23.
//

import Foundation

import Moya
import UIKit

typealias DefaultDetailService = BaseService<DetailAPI>

protocol DetailService {
    func getDetailData(_ clubID: Int) async throws -> NetworkResult<Any>
}

extension DefaultDetailService: DetailService {
    
    func getDetailData(_ clubID: Int) async -> NetworkResult<Any> {
        await self.request(target: .getDetailData(clubID), dataModel: [DetailDTO].self)
    }
}
