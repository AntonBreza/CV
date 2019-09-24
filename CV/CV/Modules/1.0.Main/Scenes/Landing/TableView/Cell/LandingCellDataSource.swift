//
//  LandingCellDataSource.swift
//  CV
//
//  Created by Anton Breza Dev on 7/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

protocol LandingCellDataSource {

    var title: String { get }
    var imageName: String { get }
}

// MARK: - LandingModel

extension LandingModel.Row: LandingCellDataSource {

    var title: String {
        return localized
    }

    var imageName: String {
        return rawValue + "_icon"
    }
}
