//
//  ContentUnavailable.swift
//  CV
//
//  Created by Anton Breza Dev on 8/29/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class ContentUnavailableView: UIView, NibLoadable {

    // MARK: - IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    @IBOutlet weak var titleLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleContainerCenterConstraint: NSLayoutConstraint!
    
    // MARK: - Setup styles

    private func setupStyles() {
        imageView
            .background(.clear)
            .tintColor(.itDarkGrey)
            .contentMode(.center)

        titleLabel
            .font(.roboto(.s28))
            .textColor(.itDarkGrey)

        messageLabel
            .font(.roboto(.s20))
            .textColor(.itDarkGrey)

        actionButton
            .font(.roboto(.s34))
            .titleColor(.itTurquoise, for: .normal)
            .title(Localization.Common.retry.localized, for: .normal)
    }

    // MARK: - Propeties

    private weak var delegate: ContentUnavailableDelegate?

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: superview)
        setupStyles()
    }

    // MARK: - IBActions

    @IBAction func retryAction(_ sender: Any) {
        delegate?.handleRetryAction()
    }

    // MARK: - Public methods

    public func setup(with dataSource: ApiLoadingState.ContentUnavailableReason.Settings, delegate: ContentUnavailableDelegate?) {
        self.delegate = delegate

        imageView
            .setupImage(dataSource.image)
            .isHidden(dataSource.isImageViewHidden)

        titleLabel
            .text(dataSource.title)
            .textAlignment(dataSource.titleAlignment)

        messageLabel
            .text(dataSource.message)

        actionButton
            .isHidden(dataSource.isActionButtonHidden)
        
        titleLabelLeadingConstraint.priority = dataSource.titleLeadingPriority
        titleContainerCenterConstraint.priority = dataSource.titleBottomPriority
    }
}
