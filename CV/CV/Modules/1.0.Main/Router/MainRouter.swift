//
//  MainRouter.swift
//  CV
//
//  Created by Anton Breza Dev on 7/8/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import UIKit
import SafariServices

protocol ProfileRouterDelegate: class {
    func perform(_ action: MainRouter.Action)
}

class MainRouter {

    // MARK: - Enum

    enum Action {
        case landing
    }

    // MARK: - Properties

    private weak var navigationController: NavigationController?

    private unowned let applicationRouter: AppRouterDelegate
    private unowned let serviceProvider: ServiceProvider

    // MARK: - Lifecycle

    init(applicationRouter: AppRouterDelegate, serviceProvider: ServiceProvider) {
        self.applicationRouter = applicationRouter
        self.serviceProvider = serviceProvider
    }

    // MARK: - Public methods

    private func showProfile() {
        let navigationController = NavigationController()
        let model = LandingModel(userService: serviceProvider.userService)
        let presenter = LandingPresenter(router: self, model: model)
        let landingController = LandingController(presenter: presenter)
        navigationController.pushViewController(landingController, animated: false)
        applicationRouter.perform(.setRootViewController(navigationController))
        self.navigationController = navigationController
    }

    private func presentSafariControllerFor(urlString: String?) {
        guard let url = URL(urlString), url.isHTTPScheme else {
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        navigationController?.present(safariViewController, animated: true, completion: nil)
    }
}

// MARK: - ActionsRouterDelegate

extension MainRouter: ProfileRouterDelegate {

    func perform(_ action: MainRouter.Action) {
        switch action {
        case .landing:
            showProfile()
        }
    }
}
