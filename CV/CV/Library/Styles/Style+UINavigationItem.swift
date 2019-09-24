//
//  Style + UINavigationItem.swift
//  CV
//
//  Created by Anton Breza Dev on 8/22/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UINavigationItem {

    @discardableResult
    public func customBackButton(_ image: UIImage, target: Any, action: Selector) -> UINavigationItem {
        let leftButton = UIBarButtonItem(image: image, style: .plain, target: target, action: action)
        self.leftBarButtonItem = leftButton
        return self
    }

    @discardableResult
    public func title(_ title: String?) -> UINavigationItem {
        self.title = title
        return self
    }

}

