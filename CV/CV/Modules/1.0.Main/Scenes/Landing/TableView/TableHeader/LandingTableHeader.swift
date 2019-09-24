//
//  LandingTableHeader.swift
//  CV
//
//  Created by Anton Breza Dev on 9/24/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class LandingTableHeader: UIView, NibLoadable {

    // MARK: - IBOutlet

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelContainer: UIView!

    // MARK: - Setup UI

    private func setupStyles() {

        avatarImageView
            .background(.clear)

        titleLabel
            .style(UILabel.Common.light23)

        titleLabelContainer
            .borderColor(.itTurquoise)
            .borderWidth(1.0)
            .halfCornerRadius()

        self
            .background(.clear)
    }

    // MARK: - Lifecycle

    convenience init() {
        let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
        let frame = CGRect(origin: CGPoint.zero, size: size)
        self.init(frame: frame)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
}
