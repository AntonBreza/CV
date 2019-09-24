//
//  ApiView.swift
//  CV
//
//  Created by Anton Breza Dev on 8/30/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class ApiView: UIView, ApiRequestDelegate {

    weak var contentUnavailableDelegate: ContentUnavailableDelegate?

    func didChangeState(_ newState: ApiLoadingState) {
        switch newState {
        case .idle, .refreshing:
            break
        case .loading:
            showActivityIndicator()
        case .loaded:
            hideNotAvailableView()
            hideActivityIndicator()
        case .contentUnavailable(let reason):
            showNotAvailableView(reason.settings, delegate: contentUnavailableDelegate)
            hideActivityIndicator()
        case .error(let error):
            handleError(error)
        }
    }
}
