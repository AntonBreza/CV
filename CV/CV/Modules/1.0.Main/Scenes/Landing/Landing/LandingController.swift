//
//  SearchViewController.swift
//  CV
//
//  Created by Anton Breza Dev on 7/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension Localization {
    enum Landing: String, Localizable {
        case tabTitle
        case aboutText
        case termsOfUse
        case logout
    }
}

class LandingController: UIViewController, ApiRequestDelegate {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Setup UI

    private func setupStyles() {

        tableView
            .background(.clear)
            .registerCell(LandingCell.self)
            .tableHeader(LandingTableHeader())
   }

    // MARK: - Propeties

    private let presenter: LandingPresenter

    // MARK: - Lifecycle

    init(presenter: LandingPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
    }

    // MARK: - Private methods

}

// MARK: - UITableViewDataSource

extension LandingController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LandingCell.identifier, for: indexPath) as? LandingCell,
            presenter.items.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        cell.setupWith(dataSource: presenter.items[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension LandingController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(indexPath)
    }
}

// MARK: - Themeable

extension LandingController: Themeable {

    var navigationBarTheme: NavigationBarTheme {
        return .hidden
    }
}
