//
//  UserService.swift
//  CV
//
//  Created by Anton Breza Dev on 8/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension Constants.User {
    struct Key {
        static let accessToken = "accessToken"
        static let profile = "profile"
    }
}

class UserService {

    // MARK: - Propeties

    private var _accessToken: String?

    public var accessToken: String? {
        get {
            let accessToken = _accessToken ?? UserDefaults.standard.string(forKey: Constants.User.Key.accessToken)
            _accessToken = accessToken
            return _accessToken
        }
        set {
            _accessToken = newValue
            UserDefaults.standard.set(newValue, forKey: Constants.User.Key.accessToken)
        }
    }

    // MARK: - Public methods

    public func logout() {
        accessToken = nil
    }
}
