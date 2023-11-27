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
    
    @discardableResult
    func getMainData() async throws -> [MainModel] {
        let result = try await self.mainService.getMainData()
        switch result {
        case .success(let data):
            dump(data)
            break
        case .requestErr(let string):
            print("")
        case .decodedErr:
            print("")
        case .pathErr:
            print("")
        case .serverErr:
            print("")
        case .networkFail:
            print("")
        case .authorizationFail(let t):
            print("")
        }
        return []
    }
}


