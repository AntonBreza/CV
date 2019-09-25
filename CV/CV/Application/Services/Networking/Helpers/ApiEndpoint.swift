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

    case profile = "cv.json"
    case photo = "CV_photo.jpg"

}

// MARK: - URLConvertible

extension ApiEndpoint: URLConvertible {

    public func asURL() throws -> URL {
        if let url = URL(string: Constants.API.baseUrl + self.rawValue) {
            return url
        }
        throw Localization.Common.Error.missingUrl
    }
}
