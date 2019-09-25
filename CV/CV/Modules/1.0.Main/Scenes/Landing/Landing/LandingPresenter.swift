//
//  LandingPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 7/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

class LandingPresenter {

    // MARK: - Properties

    public weak var view: LandingController?

    private unowned let router: ProfileRouterDelegate
    private let model: LandingModel
    public let headerPresenter: LandingHeaderPresenter

    public var rowsCount: Int {
        return model.menu.count
    }

    public var items: [LandingCellDataSource] {
        return model.menu
    }

    // MARK: - Lifecycle

    init(router: ProfileRouterDelegate, model: LandingModel, headerPresenter: LandingHeaderPresenter) {
        self.router = router
        self.model = model
        self.headerPresenter = headerPresenter
        model.apiModel.delegate = self
        model.apiModel.requestCV()
    }

    // MARK: - Public methods

    public func didSelectRowAt(_ indexPath: IndexPath) throws {
        guard model.menu.indices.contains(indexPath.row),
            let responseEntity = model.apiModel.responseEntity else {
                throw Localization.Common.Error.unableToLoadProfile
        }
        switch model.menu[indexPath.row] {
        case .generalInfo:
            router.perform(.generalInfo(headerPresenter, responseEntity.contact))
        case .education:
            router.perform(.education(responseEntity.education))
        case .employmentHistory:
            router.perform(.employment(responseEntity.employmentHistory))
        case .skills:
            guard let skillsEntity = responseEntity.skills.first else {
                throw Localization.Common.Error.unableToLoadProfile
            }
            router.perform(.skills(skillsEntity))
        case .languages:
            router.perform(.languages(responseEntity.languages))
        }
    }

    public func retry() {
        model.apiModel.refreshCV()
    }
}

// MARK: - ApiRequestDelegate

extension LandingPresenter: ApiRequestDelegate {

    func didChangeState(_ loadingState: ApiLoadingState) {
        if loadingState.isNotLoading {
            view?.tableView.refreshControl?.endRefreshing()
        }
        view?.didChangeState(loadingState)
        if loadingState == .loaded, let personEntity = model.apiModel.responseEntity?.person {
            headerPresenter.personEntity = personEntity
        }
    }
}
