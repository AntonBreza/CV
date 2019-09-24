//
//  Style+CALayer.swift
//  CV
//
//  Created by Anton Breza Dev on 8/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension CALayer {

    @discardableResult
    public func style(_ styleSetter: (CALayer) -> (CALayer)) -> (CALayer) {
        return styleSetter(self)
    }

    @discardableResult
    public func cornerRadius(_ cornerRadius: CGFloat) -> CALayer {
        self.cornerRadius = cornerRadius
        return self
    }

    @discardableResult
    public func borderWidth(_ borderWidth: CGFloat) -> CALayer {
        self.borderWidth = borderWidth
        return self
    }

    @discardableResult
    public func borderColor(_ borderColor: UIColor) -> CALayer {
        self.borderColor = borderColor.cgColor
        return self
    }

    @discardableResult
    public func masksToBounds(_ masksToBounds: Bool) -> CALayer {
        self.masksToBounds = masksToBounds
        return self
    }

    @discardableResult
    public func shadowColor(_ shadowColor: UIColor) -> CALayer {
        self.shadowColor = shadowColor.cgColor
        return self
    }

    @discardableResult
    public func shadowOffset(_ width: CGFloat, _ height: CGFloat) -> CALayer {
        self.shadowOffset = CGSize(width: width, height: height)
        return self
    }

    @discardableResult
    public func shadowRadius(_ shadowRadius: CGFloat) -> CALayer {
        self.shadowRadius = shadowRadius
        return self
    }

    @discardableResult
    public func shadowOpacity(_ shadowOpacity: Float) -> CALayer {
        self.shadowOpacity = shadowOpacity
        return self
    }

    @discardableResult
    public func backgroundColor(_ backgroundColor: UIColor) -> CALayer {
        self.backgroundColor = backgroundColor.cgColor
        return self
    }

    @discardableResult
    public func shadowPath(cornerRadius: CGFloat) -> CALayer {
        self.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        return self
    }
}


// MARK: - Styles

extension CALayer {

    struct Common {

        public static var radius10: (CALayer) -> (CALayer) {
            return { $0
                .cornerRadius(10)
                .masksToBounds(true)
            }
        }

        public static var cardShadow: (CALayer) -> (CALayer) {
            return { $0
                .shadowColor(.black)
                .shadowOffset(0.0, 6.0)
                .shadowRadius(10.0)
                .shadowOpacity(0.2)
                .masksToBounds(false)
                .backgroundColor(.clear)
            }
        }

        public static var itDefaultShadow: (CALayer) -> (CALayer) {
            return { $0
                .shadowColor(.black)
                .shadowOffset(0.0, 2.0)
                .shadowRadius(10.0)
                .shadowOpacity(0.13)
                .masksToBounds(false)
            }
        }
    }
}
