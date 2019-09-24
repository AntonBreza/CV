//
//  LandingCell.swift
//  CV
//
//  Created by Anton Breza Dev on 9/24/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class LandingCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    // MARK: - Setup UI

    private func setupStyles() {

        titleLabel
            .background(.clear)
            .font(.roboto(.s15))
            .textColor(.itDarkGrey)

        iconImageView
            .background(.clear)
            .contentMode(.center)
            .tintColor(.itDarkGrey)

        contentView
            .background(.clear)
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyles()
    }

    // MARK: - Public methods

    public func setupWith(dataSource: LandingCellDataSource) {
        titleLabel.text = dataSource.title
        iconImageView.image = UIImage(named: dataSource.imageName)?.withRenderingMode(.alwaysTemplate)
    }
}
