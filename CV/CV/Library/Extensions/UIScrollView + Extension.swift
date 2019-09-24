//
//  UIScrollView+Extension.swift
//
//
//  Created by Yehor Klosov on 3/6/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func scrollToView(view: UIView, animated: Bool) {
        let rect = self.convert(view.frame, to: self)
        self.scrollRectToVisible(rect, animated: animated)
    }
}
