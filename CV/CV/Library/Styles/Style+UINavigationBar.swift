//
//  Style+UINavigationBar.swift
//
//
//  Created by Anton Breza Dev on 2/5/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    @discardableResult
    public func barTintColor(_ barTintColor: UIColor) -> UINavigationBar{
        self.barTintColor = barTintColor
        return self
    }
    
    @discardableResult
    public override func tintColor(_ tintColor: UIColor) -> UINavigationBar{
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    public func titleTextAttributes(_ titleTextAttributes: [NSAttributedString.Key : Any]) -> UINavigationBar{
        self.titleTextAttributes = titleTextAttributes
        return self
    }
    
    @discardableResult
    public func isTranslucent(_ isTranslucent: Bool) -> UINavigationBar {
        self.isTranslucent = isTranslucent
        return self
    }
    
    @discardableResult
    public func setBackgroundImage(_ image: UIImage) -> UINavigationBar{
        self.setBackgroundImage(image, for: UIBarMetrics.default)
        return self
    }
}
