//
//  Optional+Extension.swift
//
//
//  Created by Yehor Klosov on 1/15/19.
//  Copyright © 2019 ZLX. All rights reserved.
//

import Foundation

precedencegroup LeftComposition {
    associativity: left
}

infix operator ?>: LeftComposition

public func ?> <Wrapped, Result> (lhs: Optional<Wrapped>, rhs: ((Wrapped) -> Result)?) -> Result? {
    return lhs.apply(rhs)
}

public func ?> <Value, Result> (lhs: Optional<(Value) -> Result>, rhs: Value?) -> Result? {
    return lhs.apply(rhs)
}

public extension Optional {
    
    func apply<Result>(_ ƒ: ((Wrapped) -> Result)?) -> Result? {
        return ƒ.apply(self)
    }
    
    func apply<Value, Result>(_ value: Value?) -> Result? where Wrapped == (Value) -> Result {
        return self.flatMap { value.map($0) }
    }
}
