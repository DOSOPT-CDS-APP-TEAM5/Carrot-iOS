//
//  MainRepository.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

protocol MainRepository {
    
    func getMainData(_ category: String?) async throws -> [MainModel]
}

class DefaultMainRepository: MainRepository {
    var mainService: MainService
    
    public init(mainService: MainService) {
        self.mainService = mainService
    }
    
    func getMainData(_ category: String? = nil) async throws -> [MainModel] {
        do {
            let result = try await self.mainService.getMainData(category ?? nil)
            switch result {
            case .success(let data):
                return (data as! [MainDTO]).map { $0.toDomain() }
            default:
                return []
            }
        } catch {
            throw error
        }
    }
    
    private func decode<T: Decodable>(data: Data, to target: T.Type) -> T? {
        return try? JSONDecoder().decode(target, from: data)
    }
}


