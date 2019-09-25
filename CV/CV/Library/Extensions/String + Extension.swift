//
//  String + Extension.swift
//
//
//  Created by Anton Breza Dev Dev on 3/11/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
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

    static var hyphen: String {
        return "-"
    }

    static var colon: String {
        return ":"
    }

    static var comma: String {
        return ","
    }

    static var tab: String {
        return "\t"
    }

    static var bulletPoint: String {
        return "➤"
    }

    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: self)
    }

    var digits: String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
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

    var snakeCased: String? {
        let pattern = "([a-z0-9])([A-Z])"

        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1_$2").lowercased()
    }

    func camelCaseToCommon() throws -> String {
        let pattern = "[A-Z]"
        let regularExpression = try NSRegularExpression(pattern: pattern)
        return self.replace(regex: regularExpression) { " \($0)" }.lowercased()
    }

    func replace(regex: NSRegularExpression, with replacer: (_ match:String)->String) -> String {
        let str = self as NSString
        let ret = str.mutableCopy() as! NSMutableString

        let matches = regex.matches(in: str as String, options: [], range: NSMakeRange(0, str.length))
        for match in matches.reversed() {
            let original = str.substring(with: match.range)
            let replacement = replacer(original)
            ret.replaceCharacters(in: match.range, with: replacement)
        }
        return ret as String
    }
}
