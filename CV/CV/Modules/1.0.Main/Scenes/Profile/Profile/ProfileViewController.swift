//
//  SearchViewController.swift
//  CV
//
//  Created by Anton Breza Dev on 7/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension Localization {
    enum Profile: String, Localizable {
        case tabTitle
        case aboutText
        case termsOfUse
        case logout
    }
}

class ProfileViewController: UIViewController, ApiRequestDelegate {

    // MARK: - IBOutlets

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var codeContainer: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Setup UI

    private func setupStyles() {

        topImageView
            .background(.clear)
            .setupImage(#imageLiteral(resourceName: "it_card_logo"))

        bottomImageView
            .background(.clear)
            .setupImage(#imageLiteral(resourceName: "it_cluster_logo"))

        nameLabel
            .style(UILabel.Common.light23)

        codeLabel
            .style(UILabel.Common.light18)

        codeContainer
            .borderColor(.itTurquoise)
            .borderWidth(1.0)
            .halfCornerRadius()

        logoutButton
            .title(Localization.Profile.logout.localized)

        tableView
            .background(.clear)
   }

    // MARK: - Propeties

    public var presenter: ProfilePresenter?
    public var alertService: AlertService?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.resizeTableFooterToFitEmptyBottomSpace(minHeight: 74.0)
    }
    
    // MARK: - IBActions

    // MARK: - Public methods

    public func showLogoutAlert(message: String, completion: @escaping Completion) {
        let okAction = AlertComposer.ok(completion: completion)
        let composer = AlertComposer(message: message, actions: [okAction])
        alertService?.showAlert(composer: composer)
    }

    // MARK: - Private methods

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = presenter?.dataSource
    }

    private func setupUI() {
        nameLabel.text = presenter?.profileName
        codeLabel.text = presenter?.profileCode
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(indexPath)
    }
}

// MARK: - Themeable

extension ProfileViewController: Themeable {

    var navigationBarTheme: NavigationBarTheme {
        return .hidden
    }
}
