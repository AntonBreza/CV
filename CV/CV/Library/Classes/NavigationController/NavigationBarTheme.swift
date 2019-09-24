//
//  NavigationBarTheme.swift
//  ApiManagerExample
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
            return Settings(isTranslucent: false, backgroundColor: .itWhite, tintColor: .itDarkGrey)
        case .translucent:
            return Settings(isTranslucent: true, backgroundColor: .clear, tintColor: .itDarkGrey)
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


