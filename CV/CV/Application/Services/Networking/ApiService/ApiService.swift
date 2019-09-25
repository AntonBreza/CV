//
//  ApiService.swift
//  APIManager
//
//  Created by Anton Breza Dev on 6/27/19.
//  Copyright © 2019 Anton Breza DEV. All rights reserved.
//

import Foundation

public typealias DataTaskCompletion = (Data?, URLResponse?, Error?) -> Void

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

    public func request(_ urlConvertible: URLConvertible, completion: @escaping DataTaskCompletion) -> URLSessionDataTask? {
        do {
            let url = try urlConvertible.asURL()
            logService.write(.📤, url.absoluteString)
            let dataTask = session.dataTask(with: url, completionHandler: completion)
            dataTask.resume()
            return dataTask
        } catch let error {
            completion(nil, nil, error)
            return nil
        }
    }
}
