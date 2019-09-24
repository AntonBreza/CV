//
//  CommonError.swift
//  CV
//
//  Created by Anton Breza Dev on 8/20/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension Localization {

    enum CommonError: String, Localizable, LocalizedError {
        case somethingWentWrong
        case unableToLoadProfile
        case profileUpdatedSuccessfully
        case shouldCancelProfileUpdate
        case noMatchesForCurrentRequest
        case missingUrl

        var errorDescription: String? {
            return localized
        }
    }
}
