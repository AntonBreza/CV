//
//  ApiCollectionView.swift
//  CV
//
//  Created by Anton Breza Dev on 8/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

// MARK: - ApiCollectionView

class ApiCollectionView: UICollectionView, ApiRequestDelegate {

    weak var contentUnavailableDelegate: ContentUnavailableDelegate?

    func didChangeState(_ newState: ApiLoadingState) {
        switch newState {
        case .idle, .refreshing:
            break
        case .loading:
            showActivityIndicator()
        case .loaded:
            hideNotAvailableView()
            hideActivityIndicator()
            refreshControl?.endRefreshing()
            reloadData()
        case .contentUnavailable(let reason):
            showNotAvailableView(reason.settings, delegate: contentUnavailableDelegate)
            hideActivityIndicator()
            refreshControl?.endRefreshing()
            reloadData()
        case .error(let error):
            handleError(error)
            refreshControl?.endRefreshing()
        }
    }
}
