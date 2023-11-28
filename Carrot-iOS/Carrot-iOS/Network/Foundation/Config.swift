//
//  Config.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/27.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}
