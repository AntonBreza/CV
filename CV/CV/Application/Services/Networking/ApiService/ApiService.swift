//
//  ApiService.swift
//  APIManager
//
//  Created by Anton Breza Dev on 6/27/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import Foundation

public class ApiService {

    // MARK: - Properties

    public let configuration: URLSessionConfiguration
    private let logService: LogService
    private let session: URLSession

    // MARK: - Init

    public init(logService: LogService) {
        self.configuration = URLSessionConfiguration.default
        self.configuration.timeoutIntervalForRequest = 60
        self.session = URLSession(configuration: configuration)
        self.logService = logService
    }

    // MARK: - Public methods

//    public func request(_ context: ApiRequest) -> DataRequest {
//        logService.write(.📤, try? context.urlConvertible.asURL().absoluteString)
//        return session
//            .request(context)
//            .loggingResponseFailure
//    }
}
