//
//  Typealias.swift
//  CV
//
//  Created by Anton Breza Dev on 7/4/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import Foundation

public typealias Completion = () -> ()
public typealias BoolCompletion = (Bool) -> ()
public typealias ErrorCompletion = (Error?) -> ()
public typealias StringCompletion = (String) -> ()
public typealias ComposerCompletion = (AlertComposer) -> ()
public typealias IntCompletion = (Int) -> ()
public typealias ActionSheetCompletion = (Int, String) -> ()

