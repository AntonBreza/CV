//
//  Style+UITabBar.swift
//
//
//  Created by Yehor Klosov on 2/5/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

public extension UITabBarItem {
    
    @discardableResult
    @objc func style(_ styleSetter: (UITabBarItem) -> (UITabBarItem)) -> (UITabBarItem) {
        return styleSetter(self)
    }

    @discardableResult
    @objc func badgeColor(_ badgeColor: UIColor) -> UITabBarItem {
        self.badgeColor = badgeColor
        return self
    }

    @discardableResult
    @objc func title(_ title: String?) -> UITabBarItem {
        self.title = title
        return self
    }

    @discardableResult
    @objc func image(_ image: UIImage?) -> UITabBarItem {
        self.image = image?.withRenderingMode(.alwaysTemplate)
        return self
    }
}

// MARK: - Common

public extension UITabBarItem {

    struct Common {

        public static var basic: (UITabBarItem) -> (UITabBarItem) {
            return { $0
                .badgeColor(.clear)
            }
        }
    }
}

// MARK: - Appearance

extension UITabBarItem {

    @discardableResult
    @objc public static func normalColor(_ normalColor: UIColor) -> UITabBarItem.Type {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: normalColor], for: .normal)
        return self
    }

    @discardableResult
    @objc public static func selectedColor(_ selectedColor: UIColor) -> UITabBarItem.Type {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        return self
    }
}
