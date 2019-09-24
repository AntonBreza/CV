//
//  UIView + ApiRequestDelegate.swift
//  CV
//
//  Created by Anton Breza Dev on 8/29/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension Constants.Tag {
    static let notAvailableView: Int = 1011
}
extension ApiRequestDelegate where Self: UIView {

    // MARK: - Properties

    private var notAvailableView: ContentUnavailableView {
        let existingLabel = subviews.first(where: { $0.tag == Constants.Tag.notAvailableView } ) as? ContentUnavailableView
        return existingLabel ?? getNotAvailableView()
    }

    private var activityIndicator: UIActivityIndicatorView {
        let existingIndicator = subviews.first(where: { $0 is UIActivityIndicatorView && $0.tag == Constants.Tag.collecitonActivityIndicator } ) as? UIActivityIndicatorView
        return existingIndicator ?? getActivityIndicator()
    }

    // MARK: - Public methods

    public func showActivityIndicator() {
        activityIndicator.animate(true)
    }

    public func hideActivityIndicator() {
        activityIndicator.animate(false)
    }

    public func handleError(_ error: Error) {
        hideActivityIndicator()
        let reason = ApiLoadingState.ContentUnavailableReason.error(error)
        showNotAvailableView(reason.settings, delegate: contentUnavailableDelegate)
    }

    public func showNotAvailableView(_ settings: ApiLoadingState.ContentUnavailableReason.Settings, delegate: ContentUnavailableDelegate?) {
        notAvailableView.setup(with: settings, delegate: delegate)
        notAvailableView.isHidden(false)
    }

    public func hideNotAvailableView() {
        notAvailableView.isHidden(true)
    }

    // MARK: - Private metthods

    private func getNotAvailableView() -> ContentUnavailableView {
        return ContentUnavailableView()
            .style(UIView.Common.mainContainer)
            .tag(Constants.Tag.notAvailableView)
            .pinnedToCenter(self)
            .equalSizeTo(self) as! ContentUnavailableView
    }

    private func getActivityIndicator() -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
            .setupStyle(UIActivityIndicatorView.Common.controllerIndicator)
            .tag(Constants.Tag.collecitonActivityIndicator)
            .pinnedToCenter(self)
    }
}
