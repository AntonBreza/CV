//
//  MessageError.swift
//  CV
//
//  Created by Anton Breza Dev on 8/16/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public struct MessageError: LocalizedError {

    public var message: String

    public var localizedDescription: String {
        return message
    }

    public var errorDescription: String? {
        return localizedDescription
    }
}

// MARK: - MessageError

extension String {

    var asError: MessageError {
        return MessageError(message: self)
    }
}
