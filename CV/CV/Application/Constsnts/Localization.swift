//
//  Localization.swift
//  CV
//
//  Created by Anton Breza Dev on 8/7/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public protocol Localizable: Encodable & CaseIterable {}

// MARK: - Encodable

public extension Encodable {

    var localized: String {
        let localizedString = NSLocalizedString(mirroredString, comment: String())
        return localizedString.trimmingCharacters(in: .whitespaces).isEmpty ? mirroredString : localizedString
    }

    var mirroredString: String {
        let mirror = Mirror(reflecting: self)
        var typeString = String(reflecting: mirror.subjectType).components(separatedBy: String.point)
        typeString.removeFirst(2)
        typeString.append(String(describing: self))
        return typeString.joined(separator: String.underscore).snakeCased ?? String()
    }

    var localizaionString: String {
        return String(format: Localization.localizationFileFormat, self.localized, self.localized)
    }
}

// MARK: - Localization

public struct Localization {

    // MARK: - Common

    public enum Common: String, Localizable {

        case errorOccured
        case noInternetConnection
        case noItemsAvailable
        case retry
        case ok
        case cancel

        enum Error: String, Localizable, LocalizedError {

            case somethingWentWrong
            case unableToLoadProfile
            case noMatchesForCurrentRequest
            case unableToPerformRequest
            case missingUrl

            var errorDescription: String? {
                return localized
            }
        }

        static var all: [Encodable] {
            let allCommon = Common.allCases as [Encodable]
            let allCommonError = Common.Error.allCases as [Encodable]
            return allCommon + allCommonError
        }
    }

    // MARK: - Properties

    fileprivate static let localizationFileFormat: String = "\"%@\" = \"%@\";"

    public var allString: [String] {
        return all.map { $0.localizaionString }
    }

    public var allNotLocalized: [String] {
        return all.filter { $0.localized == $0.mirroredString }.map { $0.localized }
    }

    private var all: [Encodable] = {
        let common = Common.all
        let main = Localization.main
        return common + main
    }()

    // MARK: - Public methods

    public func logAllNotLocalized() {
        return all.filter { $0.localized == $0.mirroredString }.forEach { print($0.localizaionString) }
    }
}

