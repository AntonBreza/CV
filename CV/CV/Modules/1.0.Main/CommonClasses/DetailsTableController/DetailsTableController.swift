//
//  DetailsTableController.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class DetailsTableController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Setup Styles

    private func setupStyles() {

        tableView
            .background(.clear)
            .tableFooter(UIView())

        navigationItem
            .title(dataSource.title)
    }

    // MARK: - Propeties

    private let dataSource: DetailsTableDataSource

    // MARK: - Lifecycle

    init(dataSource: DetailsTableDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
    }
}

// MARK: - UITableViewDataSource

extension DetailsTableController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.rowsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: UITableViewCell.identifier)

        cell.selectionStyle = .none
        dataSource.setupCell(cell, at: indexPath)
        return cell
    }
}

// MARK: - Themeable

extension DetailsTableController: Themeable {

    var navigationBarTheme: NavigationBarTheme {
        return .translucent
    }
}
