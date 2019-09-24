//
//  Data + ApiExtension.swift
//  CV
//
//  Created by Anton Breza Dev on 8/22/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension Data {
    func log() {
        print(String(data: self, encoding: .utf8) ?? String.empty)
    }
}
