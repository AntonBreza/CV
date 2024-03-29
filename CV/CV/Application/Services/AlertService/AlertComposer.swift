//
//  AlertComposer.swift
//
//
//  Created by Anton Breza Dev Dev on 4/2/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public struct AlertComposer {

    // MARK: - Properties

    let message: String?
    let title: String?
    let actions: [UIAlertAction]
    let collapseTime: TimeInterval
    let style: UIAlertController.Style

    // MARK: - Init

    init(message: String?, title: String? = nil, actionSheetOpions: [String], completion: @escaping ActionSheetCompletion) {
        var actions = [UIAlertAction]()
        for (index, option) in actionSheetOpions.enumerated() {
            let action = UIAlertAction(title: option, style: .default) { (_) in
                completion(index, option)
            }
            actions.append(action)
        }
        self.init(message: message, title: title, actions: actions, style: .actionSheet)
    }

    init(message: String?, title: String? = nil, actions: [UIAlertAction], style: UIAlertController.Style = .alert) {
        self.message = message
        self.title = title
        self.actions = actions
        self.style = style
        self.collapseTime = 0.0
    }

    init(message: String?, title: String? = nil, collapseTime: TimeInterval = TimeInterval.alert.t1_50) {
        self.message = message
        self.title = title
        self.actions = [UIAlertAction]()
        self.collapseTime = collapseTime
        self.style = .alert
    }

    // MARK: - Public methods

    static func ok(completion: Completion? = nil) -> UIAlertAction {
        return UIAlertAction(title: Localization.Common.ok.localized, style: .default) { (_) in
            completion?()
        }
    }

    static func retry(completion: Completion? = nil) -> UIAlertAction {
        return UIAlertAction(title: Localization.Common.retry.localized, style: .default) { (_) in
            completion?()
        }
    }

    static func cancel(completion: Completion? = nil) -> UIAlertAction {
        return UIAlertAction(title: Localization.Common.cancel.localized, style: .default) { (_) in
            completion?()
        }
    }
}
