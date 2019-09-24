//
//  ProfileCellDataSource.swift
//  CV
//
//  Created by Anton Breza Dev on 7/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

protocol ProfileCellDataSource {

    var title: String { get }
    var imageName: String { get }
}

// MARK: - ProfileModel

extension Localization.ProfileMenu: ProfileCellDataSource {

    var title: String {
        return localized
    }

    var imageName: String {
        return rawValue + "_icon"
    }
}
