//
//  UIView+ScreenShot.swift
//
//
//  Created by Anton Breza Dev on 3/28/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public extension UIView {
    
    func takeScreenshot() -> UIImage {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image != nil ? image! : UIImage()
    }
}

public extension UIView {
    class func fromNib<View>(owner: Any? = nil) -> View {
        let nib = UINib(nibName: String(describing: self), bundle: nil)

        return nib.instantiate(withOwner: owner, options: nil)[0] as! View
    }

    class var identifier: String {
        return String(describing: self)
    }
}

public protocol NibLoadable { }

public extension NibLoadable where Self: UIView {
    func loadFromNib() {
        let view: UIView = Self.fromNib(owner: self)
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.leftAnchor.constraint(equalTo: self.leftAnchor),
                                     view.rightAnchor.constraint(equalTo: self.rightAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}

public extension UIView {

    func temporaryBlockUserInteraction(for delay: TimeInterval = TimeInterval.animation.t0_45) {
        isUserInteractionEnabled = false
        let delay = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: delay) { [weak self] in
            self?.isUserInteractionEnabled = true
        }
    }
}
