//
//  LandingHeader.swift
//  CV
//
//  Created by Anton Breza Dev on 9/24/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension Constants.Landing {
    static let headerHeight: CGFloat = 284.0
}

class LandingHeader: UIView, NibLoadable {

    // MARK: - IBOutlet

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var positionLabelContainer: UIView!
    @IBOutlet weak var dateOfBirthLabel: UILabel!

    // MARK: - Properites

    private var presenter: LandingHeaderPresenter?

    // MARK: - Lifecycle

    convenience init(presenter: LandingHeaderPresenter) {
        let size = CGSize(width: UIScreen.main.bounds.width, height: Constants.Landing.headerHeight)
        let frame = CGRect(origin: CGPoint.zero, size: size)
        self.init(frame: frame)
        self.presenter = presenter
        presenter.view = self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.halfCornerRadius()
        avatarContainer.halfCornerRadius()
        positionLabelContainer.halfCornerRadius()
    }

    // MARK: - Public methods

    public func updateImage(_ image: UIImage?) {
        avatarImageView
            .setupImage(image ?? #imageLiteral(resourceName: "portrait_placeholder"))
            .contentMode(.scaleAspectFill)
            .halfCornerRadius()
    }

    public func setup(with presenter: LandingHeaderPresenter) {
        self.presenter = presenter
        presenter.view = self
        setup(with: presenter.personEntity)
        presenter.loadImage()
    }

    public func setup(with personEntity: PersonEntity?) {
        cleanUp()

        guard let personEntity = personEntity else {
            return
        }

        avatarImageView
            .background(.clear)
            .setupImage(#imageLiteral(resourceName: "portrait_placeholder"))
            .halfCornerRadius()

        avatarContainer
            .halfCornerRadius()
            .background(UIColor.cvTurquoise.withAlphaComponent(0.3))

        titleLabel
            .text(personEntity.name)
            .style(UILabel.Common.bold14)

        positionLabel
            .text(personEntity.position)
            .style(UILabel.Common.normal14)

        positionLabelContainer
            .borderColor(.cvTurquoise)
            .borderWidth(1.0)
            .halfCornerRadius()

        dateOfBirthLabel
        .text(personEntity.dateOfBirth)
        .style(UILabel.Common.light14)

        self
            .background(.clear)
    }

    // MARK: - Private method

    private func cleanUp() {
        titleLabel.text(String.empty)
        positionLabel.text(String.empty)
        dateOfBirthLabel.text(String.empty)
        avatarImageView.background(.clear)
    }
}
