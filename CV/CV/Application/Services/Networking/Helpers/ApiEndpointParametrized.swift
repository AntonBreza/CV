//
//  ApiEndpointParametrized.swift
//  CV
//
//  Created by Anton Breza Dev on 9/3/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

// MARK: - ApiEndpointParametrized

struct ApiEndpointParametrized {

    let endpoint: ApiEndpoint
    let parameterString: String

    init(endpoint: ApiEndpoint, parameterString: String) {
        self.endpoint = endpoint
        self.parameterString = parameterString
    }
}

// MARK: - URLConvertible

extension ApiEndpointParametrized: URLConvertible {

    public func asURL() throws -> URL {
        if let url = URL(string: Constants.API.baseUrl + endpoint.rawValue + parameterString) {
            return url
        }
        throw Localization.CommonError.missingUrl
    }
}
