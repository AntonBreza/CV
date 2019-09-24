//
//  RealmRouter.swift
//  ApiManagerExample
//
//  Created by Anton Breza Dev on 7/8/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import UIKit
import SafariServices

protocol ProfileRouterDelegate: class {
    func perform(_ action: ProfileRouter.Action)
}

class ProfileRouter {

    // MARK: - Enum

    enum Action {
        case profile
    }

    // MARK: - Properties

    private weak var navigationController: NavigationController?

    // MARK: - Lifecycle

    init(serviceProvider: ServiceProvider, applicationRouter: ApplicationRouter) {

    }

    // MARK: - Public methods

    private func showProfile() {

    }

    private func showMenuDetails(_ menuItem: Localization.ProfileMenu) {
        switch menuItem {
        default:
            break
        }
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

extension ProfileRouter: ProfileRouterDelegate {

    func perform(_ action: ProfileRouter.Action) {
        switch action {
        case .profile:
            showProfile()
        }
    }
}
