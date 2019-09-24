//
//  URLConvertible + Extension.swift
//  Costless
//
//  Created by Anton Breza Dev on 7/19/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension URLConvertible {

    var endpoint: String {
        guard let url = try? self.asURL() else {
            return String()
        }
        return url.endpoint
    }
}
