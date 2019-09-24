//
//  Style+UITextField.swift
//
//
//  Created by Yehor Klosov on 2/5/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension Constants.Style {

    struct TextField {
        static let underlineLayerName = "underlineLayer"
    }
}

extension UITextField {

    @discardableResult
    @objc public func style(_ styleSetter: (UITextField) -> (UITextField)) -> (UITextField) {
        return styleSetter(self)
    }

    @discardableResult
    @objc public func font(_ font: UIFont) -> UITextField {
        self.font = font
        return self
    }

    @discardableResult
    @objc public func textColor(_ color: UIColor) -> UITextField {
        self.textColor = color
        return self
    }

    @discardableResult
    @objc public override func background(_ color: UIColor) -> UITextField {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    @objc public func isSecureTextEntry(_ secure: Bool) -> UITextField {
        self.isSecureTextEntry = secure
        return self
    }

    @discardableResult
    @objc public func returnKeyType(_ type: UIReturnKeyType) -> UITextField {
        self.returnKeyType = type
        return self
    }

    @discardableResult
    @objc public func autocapitalizationType(_ type: UITextAutocapitalizationType) -> UITextField {
        self.autocapitalizationType = type
        return self
    }

    @discardableResult
    @objc public func placeholder(_ text: String, color: UIColor, font: UIFont, paragraphStyle: NSParagraphStyle? = nil) -> UITextField {
        var attributes: [NSAttributedString.Key : Any] = [.foregroundColor: color, .font : font]
        if let paragraph = paragraphStyle {
            attributes[.paragraphStyle] = paragraph
        }
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
        return self
    }

    @discardableResult
    @objc public func keyboardType(_ type: UIKeyboardType) -> UITextField {
        self.keyboardType = type
        return self
    }

    @discardableResult
    @objc public override func borderColor(_ color: UIColor) -> UITextField {
        self.layer.borderColor = color.cgColor
        return self
    }

    @discardableResult
    @objc public override func borderWidth(_ width: CGFloat) -> UITextField {
        self.layer.borderWidth = width
        return self
    }

    @discardableResult
    @objc public override func cornerRadius(_ radius: CGFloat) -> UITextField {
        self.layer.cornerRadius = radius
        return self
    }

    @discardableResult
    @objc public func returnKey(_  returnKey: UIReturnKeyType) -> UITextField {
        self.returnKeyType = returnKey
        return self
    }

    @discardableResult
    @objc public func autocapitalization(_  autocapitalizationType: UITextAutocapitalizationType) -> UITextField {
        self.autocapitalizationType = autocapitalizationType
        return self
    }

    @discardableResult
    @objc public func keyboardAppearance(_  keyboardAppearance: UIKeyboardAppearance) -> UITextField {
        self.keyboardAppearance = keyboardAppearance
        return self
    }

    @discardableResult
    @objc public func rightView(_  rightView: UIView) -> UITextField {
        self.rightView = rightView
        return self
    }

    @discardableResult
    @objc public func setupRightView(_  rightView: UIView) -> UITextField {
        rightView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.frame.height, height: self.frame.height))
        self.rightView = rightView
        return self
    }

    @discardableResult
    @objc public func textAlignment(_  textAlignment: NSTextAlignment) -> UITextField {
        self.textAlignment = textAlignment
        return self
    }

    @discardableResult
    @objc public func setupRightImage(_  image: UIImage?, tintColor: UIColor?, mode: UITextField.ViewMode = .unlessEditing) -> UITextField {
        guard let image = image else {
            return self
        }
        let imageView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = tintColor
        imageView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.frame.height, height: self.frame.height))
        imageView.contentMode = .center
        rightView = imageView
        rightViewMode = mode
        return self
    }

    @discardableResult
    @objc public func underline(_ width: CGFloat, color: UIColor) -> UITextField {
        let name = Constants.Style.TextField.underlineLayerName
        layer.sublayers?.first(where: {$0.name == name} )?.removeFromSuperlayer()
        let borderLayer = CALayer()
        let lineWidth = width
        borderLayer.borderColor = color.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.frame.size.height - lineWidth, width:  self.frame.size.width, height: self.frame.size.height)
        borderLayer.borderWidth = lineWidth
        borderLayer.name = name
        self.layer.addSublayer(borderLayer)
        self.layer.masksToBounds = true
        return self
    }

    @discardableResult
    public override func tintColor(_ tintColor: UIColor) -> UITextField {
        self.tintColor = tintColor
        self.inputAccessoryView?.tintColor = tintColor
        return self
    }

    @discardableResult
    public func clearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> UITextField {
        self.clearButtonMode = clearButtonMode
        return self
    }
}

// MARK: - Styles

extension UITextField {

    struct Common {

        public static var search: (UITextField) -> (UITextField) {
            return { $0
                .style(greyUnderline_1p5)
                .textColor(.itDarkGrey)
                .background(.clear)
                .tintColor(.itGrey)
                .returnKey(.search)
                .autocapitalization(.none)
                .clearButtonMode(.always)
                .setupRightImage(#imageLiteral(resourceName: "search_icon"), tintColor: .itGrey)
            }
        }

        public static var greyUnderline_1p5:  (UITextField) -> (UITextField) {
            return { $0
                .underline(1.5, color: .itGrey)
            }
        }

        public static var lightGreyUnderline_1:  (UITextField) -> (UITextField) {
            return { $0
                .underline(1.0, color: .itLightGrey)
            }
        }
    }
}
