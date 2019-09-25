//
//  UIImageView + Extension.swift
//
//
//  Created by Anton Breza Dev Dev on 4/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit
extension UIImageView {

    func tintImage() {
        applyMonochromeInBackground()
    }

    func applyMonochromeInBackground() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self, weak image] in
            let finalImage = image?.monochrome()
            DispatchQueue.main.async {
                self?.image = finalImage
            }
        }
    }
}
