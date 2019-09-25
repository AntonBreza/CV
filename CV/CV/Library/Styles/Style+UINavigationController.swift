//
//  Style+UINavigationController.swift
//
//
//  Created by Anton Breza Dev on 2/5/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    @discardableResult
    public func extendedLayoutIncludesOpaqueBars(_ extendedLayoutIncludesOpaqueBars: Bool) -> UINavigationController {
        self.extendedLayoutIncludesOpaqueBars = extendedLayoutIncludesOpaqueBars
        return self
    }
}
