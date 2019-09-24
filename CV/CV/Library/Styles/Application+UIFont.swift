//
//  Application+UIFont.swift
//  E77-SDK
//
//  Created by Anton Breza Dev on 9/13/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public enum Size: Float {
    case s8 = 8
    case s10 = 10
    case s11 = 11
    case s12 = 12
    case s13 = 13
    case s14 = 14
    case s15 = 15
    case s16 = 16
    case s17 = 17
    case s18 = 18
    case s19 = 19
    case s20 = 20
    case s21 = 21
    case s22 = 22
    case s23 = 23
    case s24 = 24
    case s28 = 28
    case s30 = 30
    case s34 = 34
    case s38 = 38
}


public extension UIFont {

    enum AppFont: String  {
        case roboto = "Roboto-Regular"
        case robotoLight = "Roboto-Light"
        case robotoBold = "Roboto-Bold"
    }

    static func roboto(_ size: Size) -> UIFont {
        return UIFont(name: AppFont.roboto.rawValue, size: CGFloat(size.rawValue)) ?? UIFont.systemFont(ofSize: CGFloat(size.rawValue))
    }

    static func robotoLight(_ size: Size) -> UIFont {
        return UIFont(name: AppFont.robotoLight.rawValue, size: CGFloat(size.rawValue)) ?? UIFont.systemFont(ofSize: CGFloat(size.rawValue))
    }

    static func robotoBold(_ size: Size) -> UIFont {
        return UIFont(name: AppFont.robotoBold.rawValue, size: CGFloat(size.rawValue)) ?? UIFont.systemFont(ofSize: CGFloat(size.rawValue))
    }
}
