//
//  UICollectionView+Extension.swift
//  Jammi
//
//  Created by Anton Breza Dev on 7/19/18.
//  Copyright © 2018 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_ class: T.Type) {
        let name = String(describing: `class`.self)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: name)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ class: T.Type, indexPath: IndexPath, configure: ((T)->())?) -> UICollectionViewCell {
        guard let result = self.dequeueReusableCell(withReuseIdentifier: String(describing: `class`.self), for: indexPath) as? T else {
            return UICollectionViewCell()
        }
        configure?(result)
        return result
    }
    
    func registerSupplementaryView<T: UICollectionReusableView>(_ class: T.Type, ofKind kind: String) {
        let name = String(describing: `class`.self)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: name)
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(_ class: T.Type, kind: String, indexPath: IndexPath, configure: ((T)->())?) -> UICollectionReusableView {
        let name = String(describing: `class`.self)
        let view = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: name, for: indexPath)
        guard let result = view as? T else {
            return UICollectionReusableView()
        }
        configure?(result)
        return result
    }
}
