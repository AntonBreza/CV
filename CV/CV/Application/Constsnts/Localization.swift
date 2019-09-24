//
//  Localization.swift
//  CV
//
//  Created by Anton Breza Dev on 8/7/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public protocol Localizable: Encodable & CaseIterable {}

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

public struct Localization {

    static let localizationFileFormat: String = "\"%@\" = \"%@\";"

    // MARK: - Common

    public enum Common: String, Localizable {
        case errorOccured
        case noInternetConnection
        case noItemsAvailable
        case retry
        case ok
        case cancel
    }

    // MARK: - Propeties - All Cases

    private static var all: [Encodable] = {
        return [Encodable]()
    }()

    // MARK: - Public methods

    public static func logAll() {
        all.forEach { print($0.localizaionString) }
    }

    public static func logNotLocalized(_ encodables: [Encodable] = [Encodable]()) {
        var all = self.all
        all.append(contentsOf: encodables)
        all.filter { $0.localized == $0.mirroredString }.forEach { print($0.localized) }
    }
}

