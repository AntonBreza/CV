//
//  ApiRequest.swift
//  Costless
//
//  Created by Anton Breza Dev on 7/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public protocol URLConvertible {
    func asURL() throws -> URL
}

public protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}
