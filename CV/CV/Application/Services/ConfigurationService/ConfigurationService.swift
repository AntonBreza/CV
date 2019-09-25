//
//  ConfigurationService.swift
//  CV Prod
//
//  Created by Anton Breza Dev on 9/3/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

class ConfigurationService {

    // MARK: - Enum - EnvironmentType

    enum EnvironmentType {
        case production
        case development
    }

    // MARK: - Propeties

    public let environmentType: EnvironmentType

    public lazy var environment: Environment = getEnvironment(for: environmentType)

    // MARK: - Lifecycle

    init() {
        #if PRODUCTION
        environmentType = .production
        #else
        environmentType = .development
        #endif
    }

    // MARK: - Public methods

    private func getEnvironment(for type: EnvironmentType) -> Environment {
        switch type {
        case .production:
            return ProductionEnvironment()
        case .development:
            return DevelopmentEnvironment()
        }
    }
}
