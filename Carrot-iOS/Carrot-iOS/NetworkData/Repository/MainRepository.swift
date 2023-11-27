//
//  MainRepository.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation
import Combine

protocol MainRepository {
    
    func getMainData() async throws -> [MainModel]
}

class DefaultMainRepository: MainRepository {
    var mainService: MainService
    
    public init(mainService: MainService) {
        self.mainService = mainService
    }
    
    func getMainData() async throws -> [MainModel] {
        let result = try await self.mainService.getMainData()
        switch result {
        case .success(let data):
            return (data as! [MainDTO]).map { $0.toDomain() }
        default:
            break
        }
        return []
    }
    
    private func decode<T: Decodable>(data: Data, to target: T.Type) -> T? {
        return try? JSONDecoder().decode(target, from: data)
    }
}


