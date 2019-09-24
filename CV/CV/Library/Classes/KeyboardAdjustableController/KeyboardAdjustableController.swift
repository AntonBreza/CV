//
//  BaseViewController.swift
//  ApiManagerExample
//
//  Created by Anton Breza Dev on 7/4/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import UIKit

open class KeyboardAdjustableController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var scrollView: UIScrollView?

    // MARK: - Properties

    private var initialInsets: UIEdgeInsets?
    private var keyboardGestureRecognizer: UIGestureRecognizer?

    // MARK: - Lifecycle

    override open func viewDidLoad() {
        super.viewDidLoad()
        initialInsets = scrollView?.contentInset
        subscribeForKeyboardNotifications()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideKeyboard()
    }

    deinit {
        unsubscribeFromKeyboardNotifications()
    }

    // MARK: - Public methods

    @objc public func hideKeyboard() {
        self.view.endEditing(true)
    }

    // MARK: - Private methods - Notifications

    private func subscribeForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    private func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardHeight = (notification.userInfo?  [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else {
            return
        }
        adjustKeyboard(keyboardHeight)
        addKeyboardGestureRecognizer()
    }

    @objc private func keyboardWillHide(notification: Notification) {
        resetKeyboardAdjustment()
        removeKeyboardGestureRecognizer()
    }

    private func adjustKeyboard(_ keyboardHeight: CGFloat) {
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight + 8, right: 0)
        UIView.animate(withDuration: TimeInterval.animation.t0_45, animations: { [weak self] in
            self?.scrollView?.contentInset = insets
            self?.scrollView?.scrollIndicatorInsets = insets
            self?.view.layoutIfNeeded()
        })
    }

    private func resetKeyboardAdjustment() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: TimeInterval.animation.t0_45, animations: { [weak self] in
            self?.scrollView?.contentInset = self?.initialInsets ?? UIEdgeInsets.zero
            self?.scrollView?.scrollIndicatorInsets = self?.initialInsets ?? UIEdgeInsets.zero
            self?.view?.layoutIfNeeded()
        })
    }

    // MARK: - Gesture recognizer

    private func addKeyboardGestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(gestureRecognizer)
        self.keyboardGestureRecognizer = gestureRecognizer
    }

    private func removeKeyboardGestureRecognizer() {
        guard let gestureRecognizer = keyboardGestureRecognizer else {
            return
        }
        view.removeGestureRecognizer(gestureRecognizer)
        keyboardGestureRecognizer = nil
    }
}
