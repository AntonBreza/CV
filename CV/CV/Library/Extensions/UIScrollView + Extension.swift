//
//  UIScrollView+Extension.swift
//
//
//  Created by Anton Breza Dev on 3/6/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func scrollToView(view: UIView, animated: Bool) {
        let rect = self.convert(view.frame, to: self)
        self.scrollRectToVisible(rect, animated: animated)
    }
}
