//
//  NavigationBarTheme.swift
//  CV
//
//  Created by Anton Breza Dev on 7/3/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import UIKit

protocol Themeable {
    var navigationBarTheme: NavigationBarTheme { get }
}

enum NavigationBarTheme {

    case mainOpaque
    case translucent
    case hidden

    var settings: Settings? {
        switch self {
        case .mainOpaque:
            return Settings(isTranslucent: false, backgroundColor: .cvWhite, tintColor: .cvDarkGrey)
        case .translucent:
            return Settings(isTranslucent: true, backgroundColor: .clear, tintColor: .cvDarkGrey)
        case .hidden:
            return nil
        }
    }

    struct Settings {
        var isTranslucent: Bool
        var backgroundColor: UIColor?
        var tintColor: UIColor?
    }
}


