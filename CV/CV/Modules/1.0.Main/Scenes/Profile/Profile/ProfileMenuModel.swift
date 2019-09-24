//
//  ProfileModel.swift
//  CV
//
//  Created by Anton Breza Dev on 7/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension Constants.ExternalURL {
    static let developerInfo = "https://Anton Breza Dev.com"
}

extension Localization {
    
    enum ProfileMenu: String, CaseIterable, Localizable {
        case profileDetails
        case appInfo
        case conditionsInfo
        case developerInfo

        var externalUrlString: String? {
            switch self {
            case .developerInfo:
                return Constants.ExternalURL.developerInfo
            default:
                return nil
            }
        }
    }
}

class ProfileMenuModel {

    // MARK: - Properties

    private let userService: UserService

    public let menu = Localization.ProfileMenu.allCases

    // MARK: - Lifecycle

    public init(userService: UserService) {
        self.userService = userService
    }

    // MARK: - Public methods

}
