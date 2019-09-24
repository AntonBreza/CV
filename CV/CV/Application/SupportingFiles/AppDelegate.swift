//
//  AppDelegate.swift
//  CV
//
//  Created by Anton Breza Dev on 9/24/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    private lazy var cvApp: Application = Application()

    // MARK: - Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.cvApp.start()
        return true
    }
}

