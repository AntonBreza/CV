//
//  URL + Extension.swift
//  Costless
//
//  Created by Anton Breza Dev on 7/19/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension URL {

    public var endpoint: String {
        let schemeAndHost = [self.scheme, self.host].compactMap { $0 }.joined(separator: "://")
        return [schemeAndHost, self.path].compactMap { $0 }.joined(separator: "")
    }
}
