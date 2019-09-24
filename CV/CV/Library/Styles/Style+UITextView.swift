//
//  Style+UITextView.swift
//
//
//  Created by ZLX on 3/11/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UITextView {

    @discardableResult
    @objc public func  font(_ font: UIFont) -> UITextView {
        self.font = font
        return self
    }

    @discardableResult
    @objc public func  textColor(_ color: UIColor) -> UITextView {
        self.textColor = color
        return self
    }

    @discardableResult
    @objc public override func  background(_ color: UIColor) -> UITextView {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    @objc public override func  borderColor(_ color: UIColor) -> UITextView {
        self.layer.borderColor = color.cgColor
        return self
    }

    @discardableResult
    @objc public override func  borderWidth(_ width: CGFloat) -> UITextView {
        self.layer.borderWidth = width
        return self
    }

    @discardableResult
    @objc public override func  cornerRadius(_ radius: CGFloat) -> UITextView {
        self.layer.cornerRadius = radius
        return self
    }

    @discardableResult
    @objc public func text(_ text: String) -> UITextView {
        self.text = text
        return self
    }

    @discardableResult
    @objc public func contentInsets(_ insets: UIEdgeInsets) -> UITextView {
        self.textContainerInset = insets
        return self
    }

    @discardableResult
    @objc public func textAlignment(_ textAlignment: NSTextAlignment) -> UITextView {
        self.textAlignment = textAlignment
        return self
    }

    @discardableResult
    public func lineSpacing(_ lineSpacing: CGFloat?, alignment: NSTextAlignment? = nil) -> UITextView {
        guard let attributedText = attributedText else {
            return self
        }
        let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)
        mutableAttributedText.set(lineSpacing: lineSpacing, alignment: alignment)
        self.attributedText = mutableAttributedText
        return self
    }
}
