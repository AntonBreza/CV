//
//  GeneralInfoController.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class GeneralInfoController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var landingHeader: LandingHeader!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    // MARK: - Setup Styles

    private func setupStyles() {

        addressLabel
            .style(UILabel.Common.normal16)
            .text(Localization.GeneralInfo.address.localized + String.colon + String.space)
            .appendText(presenter.address, color: .cvTurquoise)
            .tapRecognizer(target: self, action: #selector(didTapLabel))

        phoneLabel
            .style(UILabel.Common.normal16)
            .text(Localization.GeneralInfo.phone.localized + String.colon + String.space)
            .appendText(presenter.phone, color: .cvTurquoise)
            .tapRecognizer(target: self, action: #selector(didTapLabel))

        emailLabel
            .style(UILabel.Common.normal16)
            .text(Localization.GeneralInfo.email.localized + String.colon + String.space)
            .appendText(presenter.email, color: .cvTurquoise)
            .tapRecognizer(target: self, action: #selector(didTapLabel))

        navigationItem
            .title(LandingModel.Row.generalInfo.localized)
    }

    // MARK: - Propeties

    private let presenter: GeneralInfoPresenter
    private let alertService: AlertService

    // MARK: - Lifecycle

    init(presenter: GeneralInfoPresenter, alertService: AlertService) {
        self.presenter = presenter
        self.alertService = alertService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
        landingHeader.setup(with: presenter.headerPresenter)
    }

    // MARK: - Private methods

    @objc private func didTapLabel(_ recognizer: UITapGestureRecognizer) {
        if recognizer.didTapLabelText(presenter.address) {
            openUrlString(presenter.addressUrlString)
        } else if recognizer.didTapLabelText(presenter.phone) {
            openUrlString(presenter.phoneUrlString)
        } else if recognizer.didTapLabelText(presenter.email) {
            openUrlString(presenter.mailUrlString)
        }
    }

    private func openUrlString(_ urlString: String?) {
        do {
            let url = try validate(urlString: urlString)
            UIApplication.shared.open(url)
        } catch {
            alertService.showAlert(error)
        }
    }

    private func validate(urlString: String?) throws -> URL {
        guard let urlString = urlString,
            let url = URL(string: urlString),
            UIApplication.shared.canOpenURL(url) else {
                throw Localization.Common.Error.unableToPerformRequest
        }
        return url
    }
}

// MARK: - Themeable

extension GeneralInfoController: Themeable {

    var navigationBarTheme: NavigationBarTheme {
        return .translucent
    }
}
