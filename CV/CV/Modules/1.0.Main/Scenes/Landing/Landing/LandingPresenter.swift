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

    public var rowsCount: Int {
        return model.menu.count
    }

    public var items: [LandingCellDataSource] {
        return model.menu
    }

    public var profileName: String {
        return String()
    }

    // MARK: - Lifecycle

    init(router: ProfileRouterDelegate, model: LandingModel) {
        self.router = router
        self.model = model
    }

    // MARK: - Public methods

    public func didSelectRowAt(_ indexPath: IndexPath) {
        guard model.menu.indices.contains(indexPath.row) else {
            return
        }
    }
}
