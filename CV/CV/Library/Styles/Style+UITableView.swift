//
//  Style+UITableView.swift
//
//
//  Created by Yehor Klosov on 2/12/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UITableView {
    
    @discardableResult
    public override func background(_ color: UIColor) -> UITableView {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    public func separator(_ separatorStyle: UITableViewCell.SeparatorStyle) -> UITableView {
        self.separatorStyle = separatorStyle
        return self
    }

    @discardableResult
    public func separatorInset(_ separatorInset: UIEdgeInsets) -> UITableView {
        self.separatorInset = separatorInset
        return self
    }

    @discardableResult
    public func separatorColor(_ color: UIColor) -> UITableView {
        self.separatorColor = color
        return self
    }

    @discardableResult
    public override func inset(_ inset: UIEdgeInsets) -> UITableView {
        self.contentInset = inset
        return self
    }

    @discardableResult
    public func tableFooter(_ tableFooter: UIView) -> UITableView {
        self.tableFooterView = tableFooter
        return self
    }

    @discardableResult
    public func tableHeader(_ tableHeader: UIView) -> UITableView {
        self.tableHeaderView = tableHeader
        return self
    }

    @discardableResult
    public func registerCell<T: UITableViewCell>(_ class: T.Type) -> UITableView {
        let name = String(describing: `class`.self)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
        return self
    }
}
