//
//  Log.swift
//  CV
//
//  Created by Anton Breza Dev on 7/10/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import Foundation

public struct LogService {

    public enum LogType: String, CaseIterable {
        case 💾, 🉐, 🧩, 📤, 💳, 📝, 🆘
    }

    // MARK: - Properties

    private let enabledElements: [LogType]

    // MARK: - Lifecycle

    public init(enabledElements: [LogType] = LogType.allCases) {
        self.enabledElements = enabledElements
    }

    // MARK: - Public methods

    public func write(_ logType: LogType, _ info: Any?...) {
        var infoArray = [Any]()
        for anyElement in info where anyElement != nil {
            infoArray.append(anyElement!)
        }
        let infoString = (infoArray.map { String(describing: $0 ) } )
        var logMessage = [logType.rawValue]
        logMessage.append(contentsOf: infoString)
        let message = logMessage.joined(separator: String.space)
        log(message)
    }

    // MARK: - Private methods

    private func isLoggingEnabled(_ text: String ) -> Bool {
        if let firstElement = text.first {
            return enabledElements.map { $0.rawValue }.contains(String(firstElement))
        }
        return false
    }

    private func log(_ text: String) {
        guard isLoggingEnabled(text) else {
            return
        }
        print(text)
    }
}
