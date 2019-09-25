//
//  Style+UISlider.swift
//
//
//  Created by Anton Breza Dev on 2/5/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UISlider {
    

    @discardableResult
    public func isContinuous(_ value: Bool) -> UISlider {
        self.isContinuous = value
        return self
    }

    @discardableResult
    public func minimumTrackTintColor(_ color: UIColor) -> UISlider {
        self.minimumTrackTintColor = color
        return self
    }

    @discardableResult
    public func maximumTrackTintColor(_ color: UIColor) -> UISlider {
        self.maximumTrackTintColor = color
        return self
    }

    @discardableResult
    public func thumbTintColor(_ color: UIColor) -> UISlider {
        self.thumbTintColor = color
        return self
    }

    @discardableResult
    public override func background(_ color: UIColor) -> UISlider {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    public func  values(min: Float = 0, max: Float = 1, current: Float = 0) -> UISlider {
        self.minimumValue = min
        self.maximumValue = max
        self.value = current
        return self
    }
}
