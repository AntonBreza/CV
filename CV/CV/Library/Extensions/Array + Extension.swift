//
//  Array + Extension.swift
//
//
//  Created by Anton Breza Dev Dev on 5/22/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension Array {
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>()
        var arrayOrdered = [Element]()
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }
        return arrayOrdered
    }
}

extension Array where Element: Comparable {

    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
