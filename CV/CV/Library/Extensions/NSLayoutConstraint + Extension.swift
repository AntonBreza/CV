//
//  NSLayoutConstraint+Extension.swift
//
//
//  Created by Anton Breza Dev on 2/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit.NSLayoutConstraint

extension NSLayoutConstraint {
    
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint? {
        guard let firstItem = self.firstItem else { return nil }
        
        return NSLayoutConstraint(item: firstItem,
                                  attribute: firstAttribute,
                                  relatedBy: relation,
                                  toItem: secondItem,
                                  attribute: secondAttribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }
}
