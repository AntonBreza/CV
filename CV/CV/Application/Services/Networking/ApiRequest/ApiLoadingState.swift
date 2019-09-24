//
//  ApiLoadingState.swift
//  Costless
//
//  Created by Anton Breza Dev on 7/18/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

// MARK: - ApiLoadingState - Equatable

public enum ApiLoadingState {

    case idle
    case loading
    case loaded
    case contentUnavailable(ContentUnavailableReason)
    case refreshing
    case error(Error)

    var isLoading: Bool {
        return [ApiLoadingState.loading, .refreshing].contains(self)
    }

    var isNotLoading: Bool {
        return !isLoading
    }

    var shouldUseCache: Bool {
        if case ApiLoadingState.error(_) = self {
            return true
        }
        if case ApiLoadingState.contentUnavailable(let reason) = self {
            return reason != .emptySearch && reason != .noCards
        }
        return false
    }
}

// MARK: - Equatable

extension ApiLoadingState: Equatable {

    public static func == (lhs: ApiLoadingState, rhs: ApiLoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.loaded, .loaded), (.refreshing, .refreshing):
            return true
        case (.contentUnavailable(let lhsReason), .contentUnavailable(let rhsReason)):
            return lhsReason == rhsReason
        case (.error(let lhsError), .error(error: let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
