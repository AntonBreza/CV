//
//  SearchPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 7/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

class ProfilePresenter {

    // MARK: - Properties

    private weak var view: ProfileViewController?
    private weak var router: ProfileRouterDelegate?

    private let shouldShowLogoutMessage: Bool = false

    public let model: ProfileMenuModel

    public lazy var dataSource = ProfileTableDataSource(presenter: self)

    public var profileName: String {
        return String()
    }

    public var profileCode: String {
        return String.empty
    }

    // MARK: - Lifecycle

    init(view: ProfileViewController?, router: ProfileRouterDelegate?, model: ProfileMenuModel) {
        self.view = view
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
