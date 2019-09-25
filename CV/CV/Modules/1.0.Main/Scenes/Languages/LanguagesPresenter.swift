//
//  LanguagesPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class LanguagesPresenter {

    // MARK: - Properties

    public let entities: [Language]

    // MARK: - Lifecycle

    init(entities: [Language]) {
        self.entities = entities
    }
}

// MARK: - DetailsTableDataSource

extension LanguagesPresenter: DetailsTableDataSource {

    var rowsCount: Int {
        return entities.count
    }

    var title: String {
        return LandingModel.Row.languages.localized
    }

    func setupCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard entities.indices.contains(indexPath.row) else {
            return
        }

        let entity = entities[indexPath.row]

        cell.textLabel?
            .font(.appFontBold(.s16))
            .textColor(.cvTurquoise)
            .text(entity.title)
            .lineSpacing(12.0)
            .numberOfLines(0)

        cell.detailTextLabel?
            .font(.appFont(.s15))
            .textColor(.cvDarkGrey)
            .text(entity.level)
            .lineSpacing(2.0)
            .numberOfLines(0)
    }
}
