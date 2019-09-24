//
//  ProfileModel.swift
//  CV
//
//  Created by Anton Breza Dev on 7/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

class LandingModel {

    // MARK: - Enum - Row

    enum Row: String, CaseIterable, Localizable {

        case generalInfo
        case education
        case employmentHistory
        case skils
        case languages

        var index: Int {
            return Row.allCases.firstIndex(of: self)!
        }
    }

    // MARK: - Properties

    private let userService: UserService

    public let menu = Row.allCases

    // MARK: - Lifecycle

    public init(userService: UserService) {
        self.userService = userService
    }

    // MARK: - Public methods

}
