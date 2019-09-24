//
//  Double + Extension.swift
//
//
//  Created by Yehor Klosov Dev on 3/5/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import Foundation

extension Double {

    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }


    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
