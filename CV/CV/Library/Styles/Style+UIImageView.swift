//
//  Style+UIImageView.swift
//
//
//  Created by Anton Breza Dev on 2/5/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UIImageView {
    

    @discardableResult
    public override func cornerRadius(_ radius: CGFloat) -> UIImageView {
        self.layer.cornerRadius = radius
        return self
    }

    @discardableResult
    public func clipsToBounds(_ flag: Bool) -> UIImageView {
        self.clipsToBounds = flag
        return self
    }

    @discardableResult
    public override func background(_ color: UIColor) -> UIImageView {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    public func imageWith(imageName: String) -> UIImageView {
        self.image = UIImage(imageLiteralResourceName: imageName)
        return self
    }

    @discardableResult
    public func setupImage(_ image: UIImage?) -> UIImageView {
        self.image = image
        return self
    }

    @discardableResult
    public func contentMode(_ contentMode: ContentMode) -> UIImageView {
        self.contentMode = contentMode
        return self
    }


    @discardableResult
    public override func tintColor(_ tintColor: UIColor) -> UIImageView {
        self.tintColor = tintColor
        return self
    }
}

