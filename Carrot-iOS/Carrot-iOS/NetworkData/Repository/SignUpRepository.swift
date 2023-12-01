//
//  SignUpRepository.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 12/1/23.
//

import Foundation

protocol SignUpRepository {
    
    func postSignUpData(nickname: String, information: String) async throws -> SimpleResponse?
}

class DefaultSignUpRepository: SignUpRepository {
    
    var signUpService: SignUpService
    
    public init(signUpService: SignUpService) {
        self.signUpService = signUpService
    }
    
    func postSignUpData(nickname: String, information: String) async throws -> SimpleResponse? {
        let result = try await self.signUpService.postSignUpData(nickname: nickname, information: information)
        guard case .success(let data) = result else {
            return nil
        }
        return data as! SimpleResponse
    }
    
    // 없어도 되는 친구 ..?
//    private func decode<T: Decodable>(data: Data, to target: T.Type) -> T? {
//        return try? JSONDecoder().decode(target, from: data)
//    }
}


