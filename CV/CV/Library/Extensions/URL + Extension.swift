//
//  URL + Extension.swift
//  CV
//
//  Created by Anton Breza Dev on 7/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public extension URL {

    init?(_ string: String?) {
        guard let string = string else {
            return nil
        }
        self.init(string: string)
    }

    var isHTTPScheme: Bool {
        return scheme?.contains("http") == true
    }
    
    var queryDictionary: [String : String] {
        let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        var queryParams = [String: String]()
        for queryItem: URLQueryItem in (urlComponents?.queryItems)! {
            if queryItem.value == nil {
                continue
            }
            queryParams[queryItem.name] = queryItem.value
        }
        return queryParams
    }
}
