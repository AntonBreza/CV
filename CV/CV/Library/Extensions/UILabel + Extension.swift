//
//  UILabel + Extension.swift
//
//
//  Created by Anton Breza Dev Dev on 5/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UILabel {

    public func applyExistingAttributes(to string: String) {
        guard let attributedText = attributedText else {
            self.text = string
            return
        }
        let attributes = attributedText.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: attributedText.length))
        self.attributedText = NSAttributedString(string: string, attributes: attributes)
    }
}
