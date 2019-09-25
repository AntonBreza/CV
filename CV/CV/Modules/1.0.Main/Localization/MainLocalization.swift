//
//  MainLocalization.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public extension Localization {

    enum GeneralInfo: String, Localizable {
        case address
        case phone
        case email
    }

    static var main: [Encodable] {
        let allLandingRows = LandingModel.Row.allCases as [Encodable]
        let allGeneralInfo = GeneralInfo.allCases as [Encodable]
        return allLandingRows + allGeneralInfo
    }
}
