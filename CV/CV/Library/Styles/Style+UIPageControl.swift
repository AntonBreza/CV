//
//  Style+UIPageControl.swift
//  E77-SDK
//
//  Created by Anton Breza Dev on 9/17/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public extension UIPageControl {

    @discardableResult
    @objc func dotBorderColor(_ color: UIColor, dotBorderWidth: CGFloat) -> UIPageControl {
        for (pageIndex, dotView) in self.subviews.enumerated() {
            if self.currentPage == pageIndex {
                dotView.backgroundColor = pageIndicatorTintColor
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
            } else {
                dotView.backgroundColor = .clear
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
                dotView.layer.borderColor = (pageIndicatorTintColor ?? UIColor.clear).cgColor
                dotView.layer.borderWidth = dotBorderWidth
            }
        }
        return self
    }

    @discardableResult
    @objc func pageIndicatorTintColor(_ color: UIColor) -> UIPageControl {
        self.pageIndicatorTintColor = color
        return self
    }
}
