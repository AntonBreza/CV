//
//  ProfileCell.swift
//  CV
//
//  Created by Anton Breza Dev on 7/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var separatorView: UIView!

    // MARK: - Setup UI

    private func setupStyles() {

        profileLabel
            .background(.clear)
            .font(.roboto(.s15))
            .textColor(.itDarkGrey)

        profileImageView
            .background(.clear)
            .contentMode(.center)
            .tintColor(.itDarkGrey)

        separatorView
            .background(.itGrey)

        contentView
            .background(.clear)
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyles()
    }

    // MARK: - Public methods

    public func setupWith(dataSource: ProfileCellDataSource) {
        profileLabel.text = dataSource.title
        profileImageView.image = UIImage(named: dataSource.imageName)?.withRenderingMode(.alwaysTemplate)
    }
}
