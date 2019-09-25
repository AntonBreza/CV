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
        case skills
        case languages

        var index: Int {
            return Row.allCases.firstIndex(of: self)!
        }
    }

    // MARK: - Properties

    public let apiModel: ProfileApiModel

    public let menu = Row.allCases

    // MARK: - Lifecycle

    public init(apiModel: ProfileApiModel) {
        self.apiModel = apiModel
    }
}
