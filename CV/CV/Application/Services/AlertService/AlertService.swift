//
//  AlertService.swift
//
//
//  Created by Anton Breza Dev on 4/2/19.
//  Copyright © 2019 Anton Breza. All rights reserved.
//

import UIKit

class AlertService {

    // MARK: - Properties

    private var presentedAlert: UIAlertController?
    private var collapseTimer: Timer? = nil

    // MARK: - Puiblic methods

    func showAlert(_ error: Error) {
        let composer = AlertComposer(message: error.localizedDescription, actions: [AlertComposer.ok()])
        let controller = UIAlertController(title: composer.title, message: composer.message, preferredStyle: .alert)
        composer.actions.forEach { controller.addAction($0) }
        showAlert(composer: composer)
    }

    public func showAlert(error: LocalizedError, completion: @escaping Completion) {
        let okAction = AlertComposer.ok(completion: completion)
        let composer = AlertComposer(message: error.localizedDescription, actions: [okAction])
        showAlert(composer: composer)
    }

    public func showRetryAlert(completion: @escaping Completion) {
        let retryAction = AlertComposer.retry(completion: completion)
        let cancelAction = AlertComposer.cancel()
        let composer = AlertComposer(message: Localization.Common.noInternetConnection.localized, actions: [retryAction, cancelAction])
        showAlert(composer: composer)
    }

    public func showAlert(composer: AlertComposer) {
        if composer.actions.isEmpty {
            showCollapsingAlert(composer: composer)
        } else if composer.style == .actionSheet {
            showActionSheet(composer: composer)
        } else {
            showAlert(title: composer.title, message: composer.message, actions: composer.actions)
        }
    }

    public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { [weak self] (_) in
            self?.presentedAlert?.popoverPresentationController?.sourceRect = CGRect(x: size.width / 2, y: size.height / 2, width: 0, height: 0)
            }, completion: nil)
    }

    // MARK: - Action alert

    private func showAlert(title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction]()) {
        guard let topController = topController() else {
            return
        }
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            controller.addAction(action)
        }
        topController.present(controller, animated: true, completion: nil)
        self.presentedAlert = controller
    }

    public func hideAlert(animated: Bool = true, completion: Completion? = nil) {
        presentedAlert?.dismiss(animated: animated, completion: completion)
        presentedAlert = nil
    }

    // MARK: - Collapsing alert

    private func showCollapsingAlert(composer: AlertComposer) {
        guard let topController = topController() else {
            return
        }
        let controller = UIAlertController(title: composer.title, message: composer.message, preferredStyle: .alert)
        self.presentedAlert = controller
        topController.present(controller, animated: true, completion: nil)
        self.collapseTimer = Timer.scheduledTimer(timeInterval: composer.collapseTime, target: self, selector: #selector(collapseAlert), userInfo: nil, repeats: false)
    }

    @objc private func collapseAlert() {
        presentedAlert?.dismiss(animated: true, completion: nil)
        presentedAlert = nil
        collapseTimer?.invalidate()
        collapseTimer = nil
    }

    // MARK: - Action sheet alert

    /**
     * Action sheet causes LayoutConstraints warning
     * http://openradar.appspot.com/49289931
     */
    private func showActionSheet(composer: AlertComposer) {
        guard let topController = topController() else {
            return
        }
        let controller = UIAlertController(title: composer.title, message: composer.message, preferredStyle: .actionSheet)
        for action in composer.actions {
            controller.addAction(action)
        }
        topController.present(controller, animated: true, completion: nil)
        self.presentedAlert = controller
    }

    // MARK: - Private methods

    private func topController() -> UIViewController? {
        return UIViewController.topViewController()
    }
}
