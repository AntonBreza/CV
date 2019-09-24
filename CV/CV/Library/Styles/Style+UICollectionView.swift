//
//  Style+UICollectionView.swift
//
//
//  Created by Yehor Klosov on 2/5/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UICollectionView {

    @discardableResult
    @objc public override func background(_ color: UIColor) -> UICollectionView {
        backgroundColor = color
        return self
    }

    @discardableResult
    @objc public override func horizontalScrollIndicator(_ show: Bool) -> UICollectionView {
        self.showsHorizontalScrollIndicator = show
        return self
    }

    @discardableResult
    @objc public override func verticalScrollIndicator(_ show: Bool) -> UICollectionView {
        showsVerticalScrollIndicator = show
        return self
    }

    @discardableResult
    @objc public override func inset(_ inset: UIEdgeInsets) -> UICollectionView {
        contentInset = inset
        return self
    }

    @discardableResult
    @objc public func isScrollEnabled(_ isScrollEnabled: Bool) -> UICollectionView {
        self.isScrollEnabled = isScrollEnabled
        return self
    }

    @discardableResult
    @objc public func refreshControl(_ target: Any, selector: Selector) -> UICollectionView {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: selector, for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.itTurquoise
        self.refreshControl = refreshControl
        return self
    }
}
