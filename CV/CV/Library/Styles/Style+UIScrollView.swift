//
//  Style+UIScrollView.swift
//  CV
//
//  Created by Anton Breza Dev on 8/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UIScrollView {

    @discardableResult
    @objc public override func background(_ color: UIColor) -> UIScrollView {
        backgroundColor = color
        return self
    }

    @discardableResult
    @objc public func  horizontalScrollIndicator(_ show: Bool) -> UIScrollView {
        self.showsHorizontalScrollIndicator = show
        return self
    }

    @discardableResult
    @objc public func  verticalScrollIndicator(_ show: Bool) -> UIScrollView {
        showsVerticalScrollIndicator = show
        return self
    }

    @discardableResult
    @objc public func  inset(_ inset: UIEdgeInsets) -> UIScrollView {
        contentInset = inset
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    @objc public func  contentInsetAdjustmentBehavior(_ behaviour: UIScrollView.ContentInsetAdjustmentBehavior) -> UIScrollView {
        contentInsetAdjustmentBehavior = behaviour
        return self
    }
}
