//
//  NSAttributedString + Extension.swift
//
//
//  Created by Anton Breza Dev Dev on 3/11/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public extension NSAttributedString {

    func updateContainted(text: String?, withAttributes attributes: [NSAttributedString.Key : Any]) -> NSMutableAttributedString {
        guard let text = text, let range = self.string.range(of: text) else {
            return NSMutableAttributedString(attributedString: self)
        }
        let nsRange = self.string.nsRange(from: range)
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        mutableAttributedString.addAttributes(attributes, range: nsRange)
        return mutableAttributedString
    }
}
