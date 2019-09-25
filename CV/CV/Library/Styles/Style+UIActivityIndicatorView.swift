//
//  Style+UIActivityIndicatorView.swift
//
//
//  Created by Anton Breza Dev on 2/5/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {

    @discardableResult
    public func setupStyle(_ styleSetter: (UIActivityIndicatorView) -> (UIActivityIndicatorView)) -> (UIActivityIndicatorView) {
        return styleSetter(self)
    }

    @discardableResult
    @objc public func style(_ style: UIActivityIndicatorView.Style) -> UIActivityIndicatorView {
        self.style = style
        return self
    }
    
    @discardableResult
    @objc public override func background(_ color: UIColor) -> UIActivityIndicatorView {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    @objc public func color(_ color: UIColor) -> UIActivityIndicatorView {
        self.color = color
        return self
    }

    @discardableResult
    @objc public override func pinnedToCenter(_ superview: UIView) -> UIActivityIndicatorView {
        if !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        return self
    }

    @discardableResult
    @objc public func dimension(_ dimenstion: CGFloat) -> UIActivityIndicatorView {
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = heightAnchor.constraint(equalToConstant: dimenstion)
        heightConstraint.priority = UILayoutPriority.defaultHigh
        heightConstraint.isActive = true
        let widhtConstraint = widthAnchor.constraint(equalToConstant: dimenstion)
        widhtConstraint.priority = UILayoutPriority.defaultHigh
        widhtConstraint.isActive = true
        layoutIfNeeded()
        return self
    }

    @discardableResult
    @objc public override func adddedTo(_ superview: UIView) -> UIActivityIndicatorView {
        superview.addSubview(self)
        return self
    }

    @discardableResult
    @objc override public func tag(_ tag: Int) -> UIActivityIndicatorView {
        self.tag = tag
        return self
    }

    @discardableResult
    @objc public func hidesWhenStopped(_ hidesWhenStopped: Bool) -> UIActivityIndicatorView {
        self.hidesWhenStopped = hidesWhenStopped
        return self
    }

    @discardableResult
    @objc public func animate(_ animate: Bool) -> UIActivityIndicatorView {
        animate
            ? startAnimating()
            : stopAnimating()
        return self
    }

    @discardableResult
    @objc public override func cornerRadius(_ value: CGFloat) -> UIActivityIndicatorView {
        layer.cornerRadius(value)
        return self
    }
}

// MARK: - Styles

public extension UIActivityIndicatorView {
    struct Common {

        public static var whiteLarge: (UIActivityIndicatorView) -> (UIActivityIndicatorView) {
            return { $0
                .style(.whiteLarge)
                .color(.white)
            }
        }

        public static var controllerIndicator: (UIActivityIndicatorView) -> (UIActivityIndicatorView) {
            return { $0
                .background(.cvLightGrey)
                .style(.whiteLarge)
                .color(.cvTurquoise)
                .dimension(45.0)
                .hidesWhenStopped(true)
                .animate(false)
                .cornerRadius(5.0)
            }
        }
    }
}
