//
// Style+UIButton.swift
//
//
// Created by Yehor Klosov on 2/5/19.
// Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UIButton {

    @discardableResult
    public func style(_ styleSetter: (UIButton) -> (UIButton)) -> (UIButton) {
        return styleSetter(self)
    }

    @discardableResult
    public override func background(_ color: UIColor) -> UIButton {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    public func title(_ title: String, for state: UIControl.State = .normal) -> UIButton {
        self.setTitle(title, for: state)
        return self
    }

    @discardableResult
    public func isEnabled(_ isEnabled: Bool) -> UIButton {
        self.isEnabled = isEnabled
        return self
    }

    @discardableResult
    public func font(_ font: UIFont) -> UIButton {
        self.titleLabel?.font = font
        return self
    }

    @discardableResult
    public func minimumFontScaleFactor(_ minimumScaleFactor: CGFloat, numberOfLines: Int = 1) -> UIButton {
        self.titleLabel?.numberOfLines = numberOfLines
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = minimumScaleFactor
        return self
    }

    @discardableResult
    public func titleColor(_ color: UIColor, for state: UIControl.State) -> UIButton {
        self.setTitleColor(color, for: state)
        return self
    }

    @discardableResult
    public override func cornerRadius(_ radius: CGFloat) -> UIButton {
        self.layer.cornerRadius = radius
        return self
    }

    @discardableResult
    public func masksToBounds(_ value: Bool) -> UIButton {
        self.layer.masksToBounds = value
        return self
    }

    @discardableResult
    public override func borderColor(_ color: UIColor) -> UIButton {
        self.layer.borderColor = color.cgColor
        return self
    }

    @discardableResult
    public override func borderWidth(_ width: CGFloat) -> UIButton {
        self.layer.borderWidth = width
        return self
    }

    @discardableResult
    public func image(_ image: UIImage, for state: UIControl.State = .normal) -> UIButton {
        self.setImage(image, for: state)
        return self
    }

    @discardableResult
    public func image(_ named: String, for state: UIControl.State = .normal, renderingMode: UIImage.RenderingMode = .alwaysTemplate) -> UIButton {
        if let image = UIImage(named: named)?.withRenderingMode(renderingMode) {
            self.setImage(image, for: state)
        }
        return self
    }


    @discardableResult
    public func contentInsets(_ horizontal: CGFloat, _ vertical: CGFloat) -> UIButton{
        self.contentEdgeInsets = UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
        return self
    }

    @discardableResult
    private func tint(_ color: UIColor) -> UIButton {
        self.tintColor = color
        return self
    }

    @discardableResult
    public func imageContentMode(_ contentMode: UIView.ContentMode) -> UIButton {
        self.imageView?.contentMode = contentMode
        return self
    }

    @discardableResult
    public func imageInset(_ inset: CGFloat, contentPadding: UIEdgeInsets = UIEdgeInsets.zero) -> UIButton {

        self.contentEdgeInsets = UIEdgeInsets(top: contentPadding.top,
                                              left: contentPadding.left,
                                              bottom: contentPadding.bottom,
                                              right: contentPadding.right + inset)
        self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                            left: inset,
                                            bottom: 0,
                                            right: -inset)
        return self
    }

    @discardableResult
    public func rightImage(_ image: UIImage, state: UIControl.State = .normal) -> UIButton {
        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.setImage(image.withRenderingMode(.alwaysTemplate), for: state)
        return self
    }

    @discardableResult
    public func setEnabledWithAlpha(_ isEnabled: Bool, disabledAlpha: CGFloat = 0.5) -> UIButton {
        let alpha: CGFloat = isEnabled ? 1.0 : disabledAlpha
        self.isEnabled = isEnabled
        self.alpha = alpha
        return self
    }

    @discardableResult
    public func interitemSpacing(_ spacing: CGFloat) -> UIButton {
        self.centerTextAndImage(spacing: spacing)
        return self
    }

    @discardableResult
    public func interitemSpacing(_ spacing: Size) -> UIButton {
        self.centerTextAndImage(spacing: CGFloat(spacing.rawValue))
        return self
    }

    @discardableResult
    public func imageTint(_ tintColor: UIColor) -> UIButton {
        self.imageView?.tintColor = tintColor
        return self
    }

    @discardableResult
    public override func halfCornerRadius() -> UIButton {
        self.layer.cornerRadius = self.bounds.size.height / 2
        return self
    }


    @discardableResult
    @objc override public func tintColor(_ color: UIColor) -> UIButton {
        self.tintColor = color
        return self
    }
}

// MARK: - Common

public extension UIButton {

    struct Common {

        public static var lightBlue13: (UIButton) -> (UIButton) {
            return { $0
                .font(.roboto(.s13))
                .titleColor(.itTurquoise, for: .normal)
                .background(.clear)
            }
        }

        public static var roundedDarkRed: (UIButton) -> (UIButton) {
            return { $0
                .contentInsets(36.0, 12.0)
                .font(.roboto(.s17))
                .background(.itGoldenRod)
                .titleColor(.itWhite, for: .normal)
                .masksToBounds(true)
                .halfCornerRadius()
            }
        }
    }
}
