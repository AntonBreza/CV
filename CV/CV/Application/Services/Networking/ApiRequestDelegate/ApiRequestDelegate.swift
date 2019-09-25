//
//  ApiRequestDelegate.swift
//  CV
//
//  Created by Anton Breza Dev on 8/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension Constants.Tag {
    static let controllerActivityIndicator: Int = 1001
    static let collecitonActivityIndicator: Int = 1002
    static let notAvailableView: Int = 1011
}

// MARK: - ApiRequestDelegate

public protocol ApiRequestDelegate: class {

    func didChangeState(_ newState: ApiLoadingState)
    var contentUnavailableDelegate: ContentUnavailableDelegate? { get }
}

public extension ApiRequestDelegate {
    
    var contentUnavailableDelegate: ContentUnavailableDelegate? {
        return nil
    }
}
