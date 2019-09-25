//
//  UIApplicationDelegate+Extension.swift
//
//
//  Created by Anton Breza Dev on 1/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UIApplicationDelegate {
    
    static var shared: Self? {
        return UIApplication.shared.delegate as? Self
    }
}
