//
//  UIView + ApiRequestDelegate.swift
//  CV
//
//  Created by Anton Breza Dev on 8/19/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

// MARK: - ApiButton

class ApiButton: UIButton, ApiRequestDelegate {

    func didChangeState(_ newState: ApiLoadingState) {
        switch newState {
        case .idle, .refreshing:
            break
        case .loading:
            showActivityIndicator()
        case .loaded:
            hideActivityIndicator()
        case .contentUnavailable:
            hideActivityIndicator()
        case .error(_):
            hideActivityIndicator()
        }
    }

    // MARK: - Activity indicator

    private var activityIndicator: UIActivityIndicatorView {
        let existingIndicator = subviews.first(where: { $0 is UIActivityIndicatorView && $0.tag == Constants.Tag.collecitonActivityIndicator } ) as? UIActivityIndicatorView
        return existingIndicator ?? getActivityIndicator()
    }

    private func getActivityIndicator() -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
            .setupStyle(UIActivityIndicatorView.Common.controllerIndicator)
            .style(.white)
            .color(.itTurquoise)
            .background(.clear)
            .dimension(17.0)
            .tag(Constants.Tag.collecitonActivityIndicator)
            .pinnedToCenter(self)
    }

    private func showActivityIndicator() {
        activityIndicator.animate(true)
        isUserInteractionEnabled = false
        imageView?.isHidden = true
    }

    private func hideActivityIndicator() {
        activityIndicator.animate(false)
        isUserInteractionEnabled = true
        imageView?.isHidden = false
    }
}
