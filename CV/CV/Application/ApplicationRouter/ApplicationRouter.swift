//
//  AppRouter.swift
//  CV
//
//  Created by Anton Breza Dev on 7/2/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//


import UIKit

protocol AppRouterDelegate: class {

    var application: Application { get }

    func perform(_ routeAction: ApplicationRouter.Action)
}

class ApplicationRouter  {

    // MARK: - Enum

    enum Action {
        case start
        case setRootViewController(UIViewController)
    }

    // MARK: - Private

    public unowned let application: Application

    private lazy var mainRouter = MainRouter(applicationRouter: self, serviceProvider: self.application)

    private let window: UIWindow

    // MARK: - Lifecycle

    init(application: Application) {
        self.application = application
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }

    // MARK: - Private methods

    private func setRootViewController(_ controller: UIViewController) {
        let options = UIWindow.TransitionOptions(direction: .fade, style: .easeIn)
        window.setRootViewController(controller, options: options)
    }

    private func start() {
        mainRouter.perform(.landing)
    }
}

// MARK: - AppRouterDelegate

extension ApplicationRouter: AppRouterDelegate {

    func perform(_ routeAction: Action) {
        switch routeAction {
        case .start:
            start()
        case .setRootViewController(let rootViewController):
            setRootViewController(rootViewController)
        }
    }
}
