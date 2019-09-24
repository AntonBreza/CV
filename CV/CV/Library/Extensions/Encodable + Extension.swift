//
//  Encodable+Extension.swift
//
//
//  Created by Yehor Klosov on 1/18/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import Foundation

extension Encodable {

    func dictionary<T>(_ options: JSONSerialization.ReadingOptions) throws -> [String: T] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: options) as? [String: T] else {
            throw NSError()
        }
        return dictionary
    }
    
    func stringDictionary() throws -> [String : String] {
        return try dictionary(.allowFragments)
    }
    
    func urlencodedString() throws -> String {
        return try (stringDictionary().compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }) as Array).sorted().joined(separator: "&").addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    func urlencoded() throws -> Data? {
        return try urlencodedString().data(using: .utf8)
    }
}
