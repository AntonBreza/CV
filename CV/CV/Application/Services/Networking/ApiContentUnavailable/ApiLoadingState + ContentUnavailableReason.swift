//
//  ContentUnavailableReason.swift
//  CV
//
//  Created by Anton Breza Dev on 8/29/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public protocol ContentUnavailableDelegate: class {
    func handleRetryAction()
}

extension ApiLoadingState {

    public enum ContentUnavailableReason {

        case emptySearch
        case noInternet
        case noCards
        case error(Error)
        case custom(ContentUnavailableReason.Settings)

        var settings: Settings {
            switch self {
            case .emptySearch:
                return Settings.emptySearch
            case .noInternet:
                return Settings.noInternet
            case .noCards:
                return Settings.noCards
            case .error(let error):
                return Settings(error: error)
            case .custom(let settings):
                return settings
            }
        }
    }
}

// MARK: - Equatable

extension ApiLoadingState.ContentUnavailableReason: Equatable {

    public static func == (lhs: ApiLoadingState.ContentUnavailableReason, rhs: ApiLoadingState.ContentUnavailableReason) -> Bool {
        switch (lhs, rhs) {
        case (.emptySearch, .emptySearch), (.noInternet, .noInternet), (.noCards, .noCards):
            return true
        case (.custom(let lhsSettings), .custom(let rhsSettings)):
            return lhsSettings == rhsSettings
        case (.error(let lhsError), .error(error: let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}

// MARK: - ContentUnavailableDataSource.Settings

public extension ApiLoadingState.ContentUnavailableReason {

    struct Settings: Equatable {

        // MARK: - Propeties

        let image: UIImage?
        let title: String
        let message: String?
        let isActionButtonHidden: Bool

        var titleLeadingPriority: UILayoutPriority {
            return image == nil ? UILayoutPriority.s750 : .s250
        }

        var titleBottomPriority: UILayoutPriority {
            return message == nil ? UILayoutPriority.s750 : .s250
        }

        var isImageViewHidden: Bool {
            return image == nil
        }

        var titleAlignment: NSTextAlignment {
            return isImageViewHidden ? NSTextAlignment.center : .left
        }

        static let emptySearch = Settings(title: Localization.CommonError.noMatchesForCurrentRequest.localizedDescription,
                                          isActionButtonHidden: true)

        static let noInternet = Settings(image: #imageLiteral(resourceName: "no_internet_error_icon"),
                                         title: Localization.Common.errorOccured.localized,
                                         message: Localization.Common.noInternetConnection.localized,
                                         isActionButtonHidden: false)

        static let noCards = Settings(image: #imageLiteral(resourceName: "no_cards_error_icon"),
                                         title: Localization.Common.noItemsAvailable.localized,
                                         isActionButtonHidden: true)

        // MARK: - Lifecycle

        init(error: Error) {
            if (error as NSError).code == ApiStatusCode.noInternetConnection {
                self = Settings.noInternet
                return
            }
            self.image = #imageLiteral(resourceName: "common_error_icon")
            self.title = Localization.Common.errorOccured.localized
            self.message = error.localizedDescription
            self.isActionButtonHidden = true
        }

        init(image: UIImage? = nil, title: String, message: String? = nil, isActionButtonHidden: Bool = true) {
            self.image = image
            self.title = title
            self.message = message
            self.isActionButtonHidden = isActionButtonHidden
        }
    }
}
