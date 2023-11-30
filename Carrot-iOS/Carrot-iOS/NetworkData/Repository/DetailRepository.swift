//
//  DetailRepository.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

protocol DetailRepository {
    
    func getMainData(_ clubID: Int) async -> DetailModel?
}

class DefaultDetailRepository: DetailRepository {
    
    var detailService: DetailService
    
    public init(detailService: DetailService) {
        self.detailService = detailService
    }
    
    func getMainData(_ clubID: Int = 1) async -> DetailModel? {
        let result = await self.detailService.getDetailData(clubID)
        guard case .success(let data) = result else {
            return nil
        }
        return (data as! DetailDTO).toDomain()
    }
    
    // 없어도 되는 친구 ..?
//    private func decode<T: Decodable>(data: Data, to target: T.Type) -> T? {
//        return try? JSONDecoder().decode(target, from: data)
//    }
}


