//
//  ApiRequestDelegate.swift
//  CV
//
//  Created by Anton Breza Dev on 8/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

// MARK: - ApiRequestDelegate

extension Constants.Tag {
    static let controllerActivityIndicator: Int = 1001
    static let collecitonActivityIndicator: Int = 1002
}

public protocol ApiRequestDelegate: class {

    func didChangeState(_ newState: ApiLoadingState)
    var contentUnavailableDelegate: ContentUnavailableDelegate? { get }
}

public extension ApiRequestDelegate {
    
    var contentUnavailableDelegate: ContentUnavailableDelegate? {
        return nil
    }
}
