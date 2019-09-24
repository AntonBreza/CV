//
//  UIViewController + ApiRequestDelegate.swift
//  CV
//
//  Created by Anton Breza Dev on 8/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public extension ApiRequestDelegate where Self: UIViewController {

    func didChangeState(_ newState: ApiLoadingState) {
        switch newState {
        case .idle, .refreshing:
            break
        case .loading:
            showActivityIndicator()
        case .loaded, .contentUnavailable:
            hideActivityIndicator()
        case .error(let error):
            hideActivityIndicator()
            showAlert(error)
        }
    }

    // MARK: - Private methods

    private var activityIndicator: UIActivityIndicatorView {
        let existingIndicator = view.subviews.first(where: { $0 is UIActivityIndicatorView && $0.tag == Constants.Tag.controllerActivityIndicator } ) as? UIActivityIndicatorView
        return existingIndicator ?? getActivityIndicator()
    }

    private func getActivityIndicator() -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
            .setupStyle(UIActivityIndicatorView.Common.controllerIndicator)
            .tag(Constants.Tag.controllerActivityIndicator)
            .pinnedToCenter(view)
    }

    private func showActivityIndicator() {
        activityIndicator.animate(true)
    }

    private func hideActivityIndicator() {
        activityIndicator.animate(false)
    }

    private func showAlert(_ error: Error) {
        guard isViewLoaded, view.window != nil else {
            return
        }
        let composer = AlertComposer(message: error.localizedDescription, actions: [AlertComposer.ok()])
        let controller = UIAlertController(title: composer.title, message: composer.message, preferredStyle: .alert)
        composer.actions.forEach { controller.addAction($0) }
        present(controller, animated: true, completion: nil)
    }
}
