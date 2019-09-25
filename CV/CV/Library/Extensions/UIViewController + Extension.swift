//
//  UIViewController+Extension.swift
//
//
//  Created by Anton Breza Dev on 1/17/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public extension UIViewController {

    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController,
            let selected = tabController.selectedViewController {
            return topViewController(controller: selected)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

// MARK: - Add/remove child

public extension UIViewController {

    func addChildController(controller: UIViewController, to containerView: UIView, animated: Bool = false) {
        guard let view = controller.view else {
            return
        }
        controller.willMove(toParent: self)
        containerView.addSubview(view)
        controller.view.frame = containerView.bounds
        addChild(controller)
        controller.didMove(toParent: self)
        let duration = animated ? TimeInterval.animation.t0_25 : 0
        UIView.animate(withDuration: duration) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }

    func removeChildController(_ controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }

    func removeTopChild() -> UIViewController? {
        guard let controller = children.first else {
            return nil
        }
        removeChildController(controller)
        return controller
    }

    @objc func popContorller(_ animted: Bool = true) {
        navigationController?.popViewController(animated: true)
    }
}
