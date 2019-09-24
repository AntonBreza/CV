//
//  UITableView+Extension.swift
//  Jammi
//
//  Created by Yehor Klosov on 6/5/18.
//  Copyright © 2018 ZLX. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(_ class: T.Type, indexPath: IndexPath, configure: ((T)->())?) -> UITableViewCell {
        let name = String(describing: `class`.self)
        let cell = self.dequeueReusableCell(withIdentifier: name, for: indexPath)
        guard let result = cell as? T else {
            return UITableViewCell()
        }
        configure?(result)
        return result
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ class: T.Type) {
        let name = String(describing: `class`.self)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(_ class: T.Type, configure: ((T)->())?) -> UITableViewHeaderFooterView {
        let name = String(describing: `class`.self)
        let view = self.dequeueReusableHeaderFooterView(withIdentifier: name)
        guard let result = view as? T else {
            return UITableViewHeaderFooterView()
        }
        configure?(result)
        return result
    }
}


extension UITableView {

    public func resizeTableFooterToFitEmptyBottomSpace(minHeight: CGFloat) {
        guard let footer = tableFooterView,
            footer.frame.height != footerEstimatedHeight else {
                return
        }
        var frame = footer.frame
        frame.size.height = max(minHeight, footerEstimatedHeight)
        footer.frame = frame
        tableFooterView = footer
    }

    private var footerEstimatedHeight: CGFloat {
        let tableHeight = frame.height
        let footerHeight = tableFooterView?.frame.height ?? 0.0
        let contentHeight = contentSize.height
        let potentialFooterHeight = tableHeight - contentHeight + footerHeight
        return potentialFooterHeight
    }
}
