//
//  NSMutableAttributedString + Extension.swift
//
//
//  Created by Yehor Klosov Dev on 3/11/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {

    func set(lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        self.addAttribute(.paragraphStyle, value:paragraphStyle, range: NSMakeRange(0, self.length))
    }

    func alignment(_ alignment: NSTextAlignment) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return toAttributed(attributes: [.paragraphStyle: paragraphStyle])
    }

    func set(lineSpacing: CGFloat?, alignment: NSTextAlignment?) {
        let paragraphStyle = NSMutableParagraphStyle()
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }
        if let alignment = alignment {
            paragraphStyle.alignment = alignment
            if alignment == .justified {
                paragraphStyle.hyphenationFactor = 1.0
            }
        }
        self.addAttribute(.paragraphStyle, value:paragraphStyle, range: NSMakeRange(0, self.length))
    }

    private func toAttributed(attributes: [NSAttributedString.Key : Any]) -> NSAttributedString {
        let range = NSRange(0...self.length-1)
        addAttributes(attributes, range: range)
        return self
    }
}
