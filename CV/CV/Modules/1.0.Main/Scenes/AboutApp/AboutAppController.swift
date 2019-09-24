//
//  AboutAppController.swift
//  CV
//
//  Created by Anton Breza Dev on 9/3/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class AboutAppController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!

    // MARK: - Setup Styles

    private func setupStyles() {
        textLabel
            .font(.roboto(.s14))
            .textColor(.itDarkGrey)
            .text(Localization.Profile.aboutText.localized)
            .lineSpacing(4.0, alignment: .justified)

        navigationItem
            .title(Localization.ProfileMenu.appInfo.localized)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
    }
}

// MARK: - Themeable

extension AboutAppController: Themeable {

    var navigationBarTheme: NavigationBarTheme {
        return .translucent
    }
}
