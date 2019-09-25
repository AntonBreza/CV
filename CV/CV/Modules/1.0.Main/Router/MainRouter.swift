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
        case generalInfo(LandingHeaderPresenter, ContactEntity)
        case education([EducationEntity])
        case employment([EmploymentHistory])
        case skills(SkillEntity)
        case languages([Language])
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

    private func showLanding() {
        let navigationController = NavigationController()
        let apiModel = ProfileApiModel(apiService: serviceProvider.apiService, logService: serviceProvider.logService)
        let model = LandingModel(apiModel: apiModel)
        let headerPresener = LandingHeaderPresenter(imageService: serviceProvider.imageService)
        let presenter = LandingPresenter(router: self, model: model, headerPresenter: headerPresener)
        let landingController = LandingController(presenter: presenter, alertService: serviceProvider.alertService)
        navigationController.pushViewController(landingController, animated: false)
        applicationRouter.perform(.setRootViewController(navigationController))
        self.navigationController = navigationController
    }

    private func showGeneralInfo(headerPresenter: LandingHeaderPresenter, contactEntity: ContactEntity) {
        let presenter = GeneralInfoPresenter(router: self, contactEntity: contactEntity, headerPresenter: headerPresenter)
        let controller = GeneralInfoController(presenter: presenter, alertService: serviceProvider.alertService)
        navigationController?.pushViewController(controller, animated: true)
    }

    private func showEducation(_ entities: [EducationEntity]) {
        let presenter = EducationPresenter(entities: entities)
        showDetailsTable(presenter)
    }

    private func showEmployment(_ entities: [EmploymentHistory]) {
        let presenter = EmploymentPresenter(entities: entities)
        showDetailsTable(presenter)
    }

    private func showSkills(_ entity: SkillEntity) {
        let presenter = SkillsPresenter(entity: entity)
        showDetailsTable(presenter)
    }

    private func showLanguages(_ entities: [Language]) {
        let presenter = LanguagesPresenter(entities: entities)
        showDetailsTable(presenter)
    }

    private func showDetailsTable(_ dataSource: DetailsTableDataSource) {
        let controller = DetailsTableController(dataSource: dataSource)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - ActionsRouterDelegate

extension MainRouter: ProfileRouterDelegate {

    func perform(_ action: MainRouter.Action) {
        switch action {
        case .landing:
            showLanding()
        case .generalInfo(let headerPresenter, let contactEntity):
            showGeneralInfo(headerPresenter: headerPresenter, contactEntity: contactEntity)
        case .education(let entities):
            showEducation(entities)
        case .employment(let entities):
            showEmployment(entities)
        case .skills(let entity):
            showSkills(entity)
        case .languages(let entities):
            showLanguages(entities)
        }
    }
}
