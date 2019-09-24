//
//  String + Extension.swift
//
//
//  Created by Yehor Klosov Dev on 3/11/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import Foundation

public extension String {

    static var empty: String {
        return ""
    }

    static var space: String {
        return " "
    }

    static var point: String {
        return "."
    }

    static var underscore: String {
        return "_"
    }

    static var lineBreak: String {
        return "\n"
    }

    static var colon: String {
        return ":"
    }

    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: self)
    }

}

public extension StringProtocol where Index == String.Index {
    
    func nsRange(from range: Range<Index>) -> NSRange {
        return NSRange(range, in: self)
    }

    var firstUppercased: String {
        return prefix(1).uppercased()  + dropFirst()
    }

    var firstCapitalized: String {
        return prefix(1).capitalized + dropFirst()
    }
}

public extension String {

    func extractIntValueWith(prefix: String) -> Int? {
        if self.contains(prefix) {
            let number = self.replacingOccurrences(of: prefix, with: String.empty)
            return Int(number)
        }
        return nil
    }
}

public extension String {

    var snakeCased: String? {
        let pattern = "([a-z0-9])([A-Z])"

        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1_$2").lowercased()
    }
}
