//
//  UIApplicationDelegate+Extension.swift
//
//
//  Created by Yehor Klosov on 1/14/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UIApplicationDelegate {
    
    static var shared: Self? {
        return UIApplication.shared.delegate as? Self
    }
}
