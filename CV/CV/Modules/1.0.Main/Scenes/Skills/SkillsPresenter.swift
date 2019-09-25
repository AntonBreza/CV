//
//  SkillsPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class SkillsPresenter {

    // MARK: - Properties

    public let entities: [(title: String, skills: [String])]

    // MARK: - Lifecycle

    init(entity: SkillEntity) {
        self.entities = entity.skills
    }
}

// MARK: - DetailsTableDataSource

extension SkillsPresenter: DetailsTableDataSource {

    var rowsCount: Int {
        return entities.count
    }

    var title: String {
        return LandingModel.Row.skills.localized
    }

    func setupCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard entities.indices.contains(indexPath.row) else {
            return
        }

        let entity = entities[indexPath.row]
        let title = (try? entity.title.camelCaseToCommon().firstUppercased) ?? entity.title
        let prefix = String.tab + String.bulletPoint + String.space
        let skills = prefix + entity.skills.joined(separator: String.lineBreak + prefix)

        cell.textLabel?
            .font(.appFontBold(.s16))
            .textColor(.cvTurquoise)
            .text(title)
            .lineSpacing(12.0)
            .numberOfLines(0)

        cell.detailTextLabel?
            .font(.appFont(.s14))
            .textColor(.cvDarkGrey)
            .text(skills)
            .lineSpacing(2.0)
            .numberOfLines(0)
    }
}
