//
//  Style+UIView.swift
//
//
//  Created by Yehor Klosov on 2/5/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    public func style(_ styleSetter: (UIView) -> (UIView)) -> (UIView) {
        return styleSetter(self)
    }

    @discardableResult
    @objc public func background(_ color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    @objc public func cornerRadius(_ value: CGFloat) -> UIView {
        self.layer.cornerRadius = value
        return self
    }

    @discardableResult
    @objc public func halfCornerRadius() -> UIView {
        self.layer.cornerRadius = self.bounds.size.height / 2
        return self
    }

    @discardableResult
    @objc public func clipToBounds() -> UIView {
        self.clipsToBounds = true
        return self
    }

    @discardableResult
    @objc public func borderWidth(_ width: CGFloat) -> UIView {
        self.layer.borderWidth = width
        return self
    }

    @discardableResult
    @objc public func borderColor(_ color: UIColor) -> UIView {
        self.layer.borderColor = color.cgColor
        return self
    }

    @discardableResult
    @objc public func tintColor(_ color: UIColor) -> UIView {
        self.tintColor = color
        return self
    }

    @discardableResult
    @objc public func isHidden(_ isHidden: Bool) -> UIView {
        self.isHidden = isHidden
        return self
    }

    @discardableResult
    @objc public func adddedTo(_ superview: UIView) -> UIView {
        superview.addSubview(self)
        return self
    }

    @discardableResult
    @objc public func alpha(_ alpha: CGFloat) -> UIView {
        self.alpha = alpha
        return self
    }

    @discardableResult
    @objc public func tag(_ tag: Int) -> UIView {
        self.tag = tag
        return self
    }

    @discardableResult
    @objc public func pinnedToCenter(_ superview: UIView) -> UIView {
        if !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        return self
    }

    @discardableResult
    @objc public func equalSizeTo(_ superview: UIView) -> UIView {
        if !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
        return self
    }

    public var noContentLabelAdded: UIView {
        UILabel()
            .style(UILabel.Common.noContent)
            .pinnedToCenter(self)
        return self
    }
}

// MARK: - Styles

extension UIView {

    struct Common {

        public static var mainContainer: (UIView) -> (UIView) {
            return { $0.background(.itWhite) }
        }

        public static var darkContainer: (UIView) -> (UIView) {
            return { $0.background(.itDarkGrey) }
        }
    }
}
