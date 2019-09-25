//
//  Data + ApiExtension.swift
//  CV
//
//  Created by Anton Breza Dev on 8/22/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

public extension Data {

    func log() {
        print(logDescription)
    }

    var logDescription: String {
        return String(data: self, encoding: .utf8) ?? String.empty
    }
}
