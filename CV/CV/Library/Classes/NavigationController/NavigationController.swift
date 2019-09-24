//
//  NavigationController.swift
//  ApiManagerExample
//
//  Created by Anton Breza Dev on 7/2/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    // MARK: - Properties

    var defaultNavBarBackgroundColor: UIColor = .green
    var defaultNavBarTintColor: UIColor = .black
    var hideBackButtonText: Bool = true

    //MARK: - Private

    private var backButtonTextCache = [UIViewController: String?]()
    private var tabBarTitle: String?

    // MARK: - Lifecycle

    init() {
        super.init(navigationBarClass: nil, toolbarClass: nil)
        self.navigationBar.shadowImage = UIImage()
        self.setNavigationTitleAttributes()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setNavigationTitleAttributes()
    }

    // MARK: - Navigation

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        tabBarTitle = tabBarItem.title
        self.cacheTitleAndHide()
        let root = (self.viewControllers.count == 0)
        self.styleViewController(viewController: viewController, root: root)
        tabBarItem.title = tabBarTitle
        super.pushViewController(viewController, animated: animated)
        interactivePopGestureRecognizer?.isEnabled = false
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        tabBarTitle = tabBarItem.title
        let destinationVC = self.viewControllers.dropLast().last
        let root = (self.viewControllers.dropLast().count == 1)
        self.uncacheTitleAndShow(viewController: destinationVC)
        self.styleViewController(viewController: destinationVC, root: root)
        tabBarItem.title = tabBarTitle
        return super.popViewController(animated: animated)
    }

    // MARK: - Styling

    private func styleViewController(viewController: UIViewController?, root: Bool) {
        guard let theme = (viewController as? Themeable)?.navigationBarTheme,
            theme != .hidden,
            let settings = theme.settings else {
                navigationBar.isHidden = true
                return
        }
        navigationBar.isHidden = false
        let backgroundColor = settings.backgroundColor ?? self.defaultNavBarBackgroundColor
        let image = settings.isTranslucent ? UIImage() : UIImage.fromColor(color: backgroundColor)
        self.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        if (!root) {
            self.navigationBar.barTintColor = backgroundColor
        }
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = settings.tintColor ?? self.defaultNavBarTintColor
        applyTitleColor(settings)
        applyTheme(settings)
    }

    private func applyTheme(_ settings: NavigationBarTheme.Settings) {
        guard settings.isTranslucent else {
            return
        }
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }

    private func applyTitleColor(_ theme: NavigationBarTheme.Settings) {
        let previous = navigationBar.titleTextAttributes ?? [:]
        let colorAtributes = [NSAttributedString.Key.foregroundColor : theme.tintColor as Any]
        navigationBar.titleTextAttributes = colorAtributes.merging(previous) { (current, _) in current }
    }

    private func setNavigationTitleAttributes() {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.robotoLight(.s19)]
    }

    // MARK: - Back Button

    private func cacheTitleAndHide() {
        guard self.hideBackButtonText,
            let viewController = self.viewControllers.last else {
                return
        }
        self.backButtonTextCache[viewController] = viewController.title
        viewController.title = ""
    }

    private func uncacheTitleAndShow(viewController: UIViewController?) {
        guard hideBackButtonText,
            let viewController = viewController,
            let cachedTitle = self.backButtonTextCache[viewController] else {
                return
        }
        viewController.title = cachedTitle
        self.backButtonTextCache[viewController] = nil
    }
}
