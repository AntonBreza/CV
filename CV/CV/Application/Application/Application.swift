//
//  ExapmpleApp.swift
//  ApiManagerExample
//
//  Created by Anton Breza Dev on 7/2/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import Foundation
import UIKit

class Application {

    // MARK: - Properties

    public let alertService = AlertService()
    public let configurationService = ConfigurationService()
    public let logService = LogService()
    public let userService: UserService = UserService()

    private (set) lazy var applicationRouter = ApplicationRouter(application: self)

    private (set) lazy var apiService: ApiService = {
        let apiService = ApiService(logService: logService)
        return apiService
    }()

    // MARK: - Lifecycle

    init() {
        setupEnvironment()
        setupAlertAppearance()
        checkLocalization()
    }

    // MARK: - Public methods

    public func start() {
        applicationRouter.perform(.start)
    }

    // MARK: -  Private methods

    private func setupAlertAppearance() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .itDarkGrey
    }

    private func setupEnvironment() {
        Constants.API.baseUrl = configurationService.environment.baseUrl
    }

    private func checkLocalization() {
        Localization.logNotLocalized()
    }
}

// MARK: - ServiceProvider

extension Application: ServiceProvider {

    public var environment: Environment {
        return configurationService.environment
    }
}
