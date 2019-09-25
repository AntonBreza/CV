//
//  Style+UILabel.swift
//
//
//  Created by Anton Breza Dev on 2/5/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit


public extension UILabel {

    @discardableResult
    func style(_ styleSetter: (UILabel) -> (UILabel)) -> (UILabel) {
        return styleSetter(self)
    }

    @discardableResult
    func text(_ text: String?) -> UILabel {
        self.text = text
        return self
    }


    @discardableResult
    override func background(_ color: UIColor) -> UILabel {
        self.backgroundColor = color
        return self
    }


    @discardableResult
    func font(_ font: UIFont) -> UILabel {
        self.font = font
        return self
    }


    @discardableResult
    func textColor(_ color: UIColor) -> UILabel {
        self.textColor = color
        return self
    }


    @discardableResult
    override func borderColor(_ color: UIColor) -> UILabel {
        self.layer.borderColor = color.cgColor
        return self
    }


    @discardableResult
    override func borderWidth(_ width: CGFloat) -> UILabel {
        self.layer.borderWidth = width
        return self
    }


    @discardableResult
    override func cornerRadius(_ radius: CGFloat) -> UILabel {
        self.layer.cornerRadius = radius
        return self
    }


    @discardableResult
    override func clipToBounds() -> UILabel {
        self.clipsToBounds = true
        return self
    }


    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> UILabel {
        self.textAlignment = alignment
        return self
    }


    @discardableResult
    func numberOfLines(_ lines: Int) -> UILabel {
        self.numberOfLines = lines
        return self
    }


    @discardableResult
    func hidden(_ isHidden: Bool) -> UILabel {
        self.isHidden = isHidden
        return self
    }


    @discardableResult
    override func tintColor(_ color: UIColor) -> UILabel {
        self.tintColor = color
        return self
    }


    @discardableResult
    override func halfCornerRadius() -> UILabel {
        self.layer.cornerRadius = self.bounds.size.height / 2
        return self
    }

    @discardableResult
    func lineBreakMode(_ mode: NSLineBreakMode) -> UILabel {
        self.lineBreakMode = mode
        return self
    }

    @discardableResult
    @objc override func pinnedToCenter(_ superview: UIView) -> UILabel {
        if !superview.subviews.contains(self) {
            superview.addSubview(self)
        }
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        return self
    }

    @discardableResult
    @objc override func tag(_ tag: Int) -> UILabel {
        self.tag = tag
        return self
    }

    @discardableResult
    func lineSpacing(_ lineSpacing: CGFloat, alignment: NSTextAlignment? = nil) -> UILabel {
        guard let attributedText = attributedText else {
            return self
        }
        let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)
        if let alignment = alignment {
            mutableAttributedText.set(lineSpacing: lineSpacing, alignment: alignment)
        } else {
            mutableAttributedText.set(lineSpacing: lineSpacing)
        }
        self.attributedText = mutableAttributedText
        return self
    }

    @discardableResult
    func appendText(_ text: String, font: UIFont? = nil, color: UIColor? = nil) -> UILabel {
        let attributedColor = color ?? self.textColor!
        let attributedFont = font ?? self.font!
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor : attributedColor,
                                                          NSAttributedString.Key.font : attributedFont]
        let attributedString = NSMutableAttributedString(attributedString: self.attributedText ?? NSAttributedString())
        attributedString.append(NSAttributedString(string: text))
        self.attributedText = attributedString.updateContainted(text: text, withAttributes: attributes)
        return self
    }

    @discardableResult
    func tapRecognizer(target: Any, action: Selector) -> UILabel {
        let gestureRecongnizer = UITapGestureRecognizer(target: target, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gestureRecongnizer)
        return self
    }
}

// MARK: - Common

public extension UILabel {

    struct Common {

        public static var listEmtpy: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFont(.s16))
                .textColor(.cvDarkGrey)
                .textAlignment(.center)
            }
        }

        public static var noContent: (UILabel) -> (UILabel) {
            return { $0
                .style(UILabel.Common.listEmtpy)
                .tag(Constants.Tag.notAvailableView)
                .text(Localization.Common.noItemsAvailable.localized)
            }
        }

        public static var light38: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFont(.s38))
                .textColor(.cvDarkGrey)
            }
        }

        public static var light30: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFont(.s30))
                .textColor(.cvDarkGrey)
            }
        }

        public static var light23: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFont(.s23))
                .textColor(.cvDarkGrey)
            }
        }

        public static var light14: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFontLight(.s14))
                .textColor(.cvDarkGrey)
            }
        }

        public static var normal14: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFont(.s14))
                .textColor(.cvDarkGrey)
            }
        }

        public static var normal16: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFont(.s16))
                .textColor(.cvDarkGrey)
                .lineSpacing(5.0)
            }
        }

        public static var bold14: (UILabel) -> (UILabel) {
            return { $0.background(.clear)
                .font(.appFontBold(.s14))
                .textColor(.cvDarkGrey)
            }
        }
    }
}
