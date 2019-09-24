//
//  UIFont + Extension.swift
//  CV
//
//  Created by Anton Breza Dev on 7/3/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import UIKit

// MARK: - Italics

extension UIFont {

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

    func setItalic()-> UIFont {
        if(isItalic) {
            return self
        } else {
            var fontAtrAry = fontDescriptor.symbolicTraits
            fontAtrAry.insert([.traitItalic])
            let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtrAry)
            return UIFont(descriptor: fontAtrDetails!, size: pointSize)
        }
    }
}

// MARK: - Log all fonts

public extension UIFont {

    static func logAllFonts() {
        let familyNames = UIFont.familyNames
        for family in familyNames {
            print("Family name " + family)
            let fontNames = UIFont.fontNames(forFamilyName: family)
            for font in fontNames {
                print("    Font name: " + font)
            }
        }
    }
}
