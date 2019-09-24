//
//  ServiceProvider.swift
//  CV
//
//  Created by Anton Breza Dev on 9/12/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

protocol ServiceProvider: class {

    var userService: UserService { get }
    var alertService: AlertService { get }
    var logService: LogService { get }
    var apiService: ApiService { get }

    var environment: Environment { get }
}
