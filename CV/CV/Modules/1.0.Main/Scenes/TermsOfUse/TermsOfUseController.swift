//
//  TermsOfUseController.swift
//  CV Prod
//
//  Created by Anton Breza Dev on 9/10/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class TermsOfUseController: KeyboardAdjustableController {

    // MARK: - IBOutlets

    @IBOutlet weak var textView: UITextView!

    // MARK: - Setup Styles

    private func setupStyles() {
        textView
            .font(.roboto(.s14))
            .textColor(.itDarkGrey)
            .text(Localization.Profile.termsOfUse.localized)
            .lineSpacing(4.0, alignment: .justified)

        navigationItem
            .title(Localization.ProfileMenu.conditionsInfo.localized)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
    }
}

// MARK: - Themeable

extension TermsOfUseController: Themeable {

    var navigationBarTheme: NavigationBarTheme {
        return .translucent
    }
}
