//
//  UIButton + Extension.swift
//  CV
//
//  Created by Anton Breza Dev on 8/7/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit


public extension UIButton {
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}

