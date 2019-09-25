//
//  UIApplication + Extension.swift
//
//
//  Created by Anton Breza Dev Dev on 3/15/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

extension UIApplication {

    // MARK: - App version

    class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }

    class func appBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }

    class func versionAndBuild() -> String {
        let version = appVersion(), build = appBuild()

        return version == build ? "Version \(version)" : "Version \(version) (\(build))"
    }
}
