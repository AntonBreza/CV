//
//  EducationPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class EducationPresenter {

    // MARK: - Properties

    public let entities: [EducationEntity]

    // MARK: - Lifecycle

    init(entities: [EducationEntity]) {
        self.entities = entities
    }
}

// MARK: - DetailsTableDataSource

extension EducationPresenter: DetailsTableDataSource {

    var rowsCount: Int {
        return entities.count
    }

    var title: String {
        return LandingModel.Row.education.localized
    }

    func setupCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard entities.indices.contains(indexPath.row) else {
            return
        }

        let entity = entities[indexPath.row]

        cell.textLabel?
            .style(UILabel.Common.normal16)
            .font(.appFontBold(.s16))
            .text(entity.organization)
            .lineSpacing(8.0)
            .numberOfLines(0)

        cell.detailTextLabel?
            .text(String.lineBreak + entity.graduation + String.lineBreak)
            .font(.appFont(.s14))
            .textColor(.cvTurquoise)
            .appendText(String.lineBreak + entity.result, font: .appFontLight(.s14), color: .cvGrey)
            .numberOfLines(0)
    }
}
