//
//  ApiStatusCode.swift
//  Costless
//
//  Created by Anton Breza Dev on 7/18/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public struct ApiStatusCode {
    static let ok = 200
    static let unauthorized = 401
    static let fileNotFound = 404
    static let notValidVersion = 410
    static let noInternetConnection = -1009
    static let unknownError = 999

    static let valid = 200..<300
}

