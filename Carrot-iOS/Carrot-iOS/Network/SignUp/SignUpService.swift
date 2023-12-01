//
//  SignUpService.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 12/1/23.
//

import Foundation

import Moya
import UIKit

typealias DefaultSignUpService = BaseService<SignUpAPI>

protocol SignUpService {
    func postSignUpData(nickname: String, information: String) async throws -> NetworkResult<Any>
}

extension DefaultSignUpService: SignUpService {
    func postSignUpData(nickname: String, information: String) async throws -> NetworkResult<Any> {
        await self.request(target: .postSignUpData(nickname: nickname, information: information), dataModel: VoidResult.self)
    }
}
