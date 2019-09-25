//
//  UIColor + Extension.swift
//  CV
//
//  Created by Anton Breza Dev on 7/3/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import UIKit

public extension UIColor {

    @nonobjc class var cvRed: UIColor {
        return UIColor(red: 226.0 / 255.0, green: 75.0 / 255.0, blue: 23.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var cvLightGrey: UIColor {
        return UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var cvGrey: UIColor {
        return UIColor(red: 155.0 / 255.0, green: 155.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var cvDarkGrey: UIColor {
        return UIColor(red: 72.0 / 255.0, green: 71.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var cvWhite: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var cvTurquoise: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 192.0 / 255.0, blue: 184.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var cvGoldenRod: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 191.0 / 255.0, blue: 7.0 / 255.0, alpha: 1.0)
    }

    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
