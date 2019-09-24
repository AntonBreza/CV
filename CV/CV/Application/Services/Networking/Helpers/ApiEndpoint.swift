//
//  ApiEndpoint.swift
//  Costless
//
//  Created by Anton Breza Dev on 7/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public extension Constants.API {
    static var baseUrl = String.empty
    static let schemeDelimiter = "://"
}

public enum ApiEndpoint: String, CaseIterable {

    case login = "api/v1/login"
    case logout = "api/v1/auth/logout"
    case refreshToken = "api/v1/auth/refresh"
    case discount = "api/v1/discount"
    case profile = "api/v1/auth/me"
    case filter = "api/v1/activity-field"
    case forgotPassword = "api/v1/forgot-password"
    case restorePassword = "api/v1/restore-password"
    case addToFavourite = "api/v1/favorite/store"
    case removeFavourite = "api/v1/favorite/destroy/"
    case updateProfile = "api/v1/profile/update"

    // MARK: - Propeties

    static let notAuthEndpoints = [ApiEndpoint.login, .refreshToken, .forgotPassword, .restorePassword]

    // MARK: - Lifecycle

    init?(url: URL?) {
        guard let scheme = url?.scheme, let host = url?.host, let path = url?.path else {
            return nil
        }
        let rawValue = (scheme + Constants.API.schemeDelimiter + host + path).replacingOccurrences(of: Constants.API.baseUrl, with: String())
        if rawValue.contains(ApiEndpoint.removeFavourite.rawValue) {
            self = ApiEndpoint.removeFavourite
            return
        }
        self.init(rawValue: rawValue)
    }

    // MARK: - Public methods

    public static func authorizationNeededFor(_ url: URL?) -> Bool {
        guard let endpoint = ApiEndpoint(url: url) else {
            return false
        }
        return !ApiEndpoint.notAuthEndpoints.contains(endpoint)
    }
}

// MARK: - URLConvertible

extension ApiEndpoint: URLConvertible {

    public func asURL() throws -> URL {
        if let url = URL(string: Constants.API.baseUrl + self.rawValue) {
            return url
        }
        throw Localization.CommonError.missingUrl
    }
}
