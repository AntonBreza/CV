//
//  SearchViewController.swift
//  CV
//
//  Created by Anton Breza Dev on 7/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

class LandingController: UIViewController, ApiRequestDelegate {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Setup Styles

    private func setupStyles() {

        tableView
            .background(.clear)
            .registerCell(LandingCell.self)
            .tableHeader(tableHeader)
            .refreshControl(self, selector: #selector(handleRetryAction))
            .tableFooter(UIView())

        view
            .background(.cvWhite)
    }

    // MARK: - Propeties

    private let presenter: LandingPresenter
    private let alertService: AlertService

    private lazy var tableHeader = LandingHeader(presenter: presenter.headerPresenter)

    // MARK: - Lifecycle

    init(presenter: LandingPresenter, alertService: AlertService) {
        self.presenter = presenter
        self.alertService = alertService
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

    // MARK: - Public methods

    public func showAlert(_ error: Error) {
        alertService.showAlert(error)
    }
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
        do {
            try presenter.didSelectRowAt(indexPath)
        } catch {
            alertService.showAlert(error)
        }
    }
}

// MARK: - ContentUnavailableDelegate

extension LandingController: ContentUnavailableDelegate {

    @objc func handleRetryAction() {
        tableView?.refreshControl?.endRefreshing()
        let deadline = DispatchTime.now() + TimeInterval.animation.t0_25
        DispatchQueue.main.asyncAfter(deadline: deadline) { [weak self] in
            self?.presenter.retry()
        }
    }
}

// MARK: - Themeable

extension LandingController: Themeable {

    var navigationBarTheme: NavigationBarTheme {
        return .hidden
    }
}
