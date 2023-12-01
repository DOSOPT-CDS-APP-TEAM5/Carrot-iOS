//
//  ClubRepository.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/23.
//

import Foundation

protocol ClubRepository {
    
    func getClubData(_ category: String?) async throws -> [ClubModel]
}

class DefaultClubRepository: ClubRepository {
    var clubService: ClubService
    
    public init(clubService: ClubService) {
        self.clubService = clubService
    }
    
    func getClubData(_ category: String? = nil) async throws -> [ClubModel] {
        do {
            let result = try await self.clubService.getClubData(category ?? nil)
            switch result {
            case .success(let data):
                return (data as! [ClubDTO]).map { $0.toDomain() }
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



