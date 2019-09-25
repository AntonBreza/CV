//
//  EmploymentPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class EmploymentPresenter {

    // MARK: - Properties

    public let entities: [EmploymentHistory]

    // MARK: - Lifecycle

    init(entities: [EmploymentHistory]) {
        self.entities = entities
    }
}

// MARK: - DetailsTableDataSource

extension EmploymentPresenter: DetailsTableDataSource {

    var rowsCount: Int {
        return entities.count
    }

    var title: String {
        return LandingModel.Row.employmentHistory.localized
    }

    func setupCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard entities.indices.contains(indexPath.row) else {
            return
        }

        let entity = entities[indexPath.row]
        let prefix = String.lineBreak + String.bulletPoint
        let description = prefix + String.space + entity.employmentHistoryDescription.components(separatedBy: String.hyphen + String.hyphen).joined(separator: prefix)

        cell.textLabel?
            .font(.appFontBold(.s16))
            .textColor(.cvTurquoise)
            .text(entity.organization)
            .appendText(String.lineBreak + entity.position, font: .appFont(.s15), color: .cvDarkGrey)
            .appendText(String.lineBreak + entity.period, font: .appFontLight(.s15), color: .cvDarkGrey)
            .lineSpacing(12.0)
            .numberOfLines(0)

        cell.detailTextLabel?
            .text(String.lineBreak + entity.generalInfo + String.colon + String.lineBreak)
            .font(.appFontBold(.s14))
            .textColor(.cvDarkGrey)
            .appendText(description, font: .appFontLight(.s14), color: .cvDarkGrey)
            .lineSpacing(1.0, alignment: .justified)
            .numberOfLines(0)
    }
}
