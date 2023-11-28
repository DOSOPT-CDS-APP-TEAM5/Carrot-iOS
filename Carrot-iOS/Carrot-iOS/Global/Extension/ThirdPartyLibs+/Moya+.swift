//
//  Moya+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/28.
//

import Foundation
import Moya

extension MoyaProvider {
    func request(_ target: Target) async -> Result<Response, MoyaError> {
        await withCheckedContinuation { continuation in
            self.request(target) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
