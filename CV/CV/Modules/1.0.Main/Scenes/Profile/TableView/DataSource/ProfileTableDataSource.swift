//
//  ProfileTableDataSource.swift
//  CV
//
//  Created by Anton Breza Dev on 7/14/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class ProfileTableDataSource: NSObject {

    // MARK: - Properties

    private weak var presenter: ProfilePresenter!

    // MARK: - Lifecycle

    init(presenter: ProfilePresenter) {
        self.presenter = presenter
    }
}

// MARK: - UITableViewDataSource

extension ProfileTableDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.model.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }
        cell.setupWith(dataSource: self.presenter.model.menu[indexPath.row])
        return cell
    }
}
