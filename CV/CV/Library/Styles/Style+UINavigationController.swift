//
//  Style+UINavigationController.swift
//
//
//  Created by Yehor Klosov on 2/5/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    @discardableResult
    public func extendedLayoutIncludesOpaqueBars(_ extendedLayoutIncludesOpaqueBars: Bool) -> UINavigationController {
        self.extendedLayoutIncludesOpaqueBars = extendedLayoutIncludesOpaqueBars
        return self
    }
}
