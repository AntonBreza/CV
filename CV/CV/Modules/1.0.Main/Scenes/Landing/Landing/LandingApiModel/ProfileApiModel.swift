//
//  ProfileApiModel.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

class ProfileApiModel {

    // MARK: - Properties

    private let apiService: ApiService
    private let logService: LogService
    private (set) var responseEntity: ProfileResponse?
    private var dataTask: URLSessionDataTask?
    public weak var delegate: ApiRequestDelegate?

    private (set) var loadingState: ApiLoadingState = .idle {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.delegate?.didChangeState(self.loadingState)
            }
        }
    }

    // MARK: - Lifecycle

    init(apiService: ApiService, logService: LogService) {
        self.apiService = apiService
        self.logService = logService
    }

    // MARK: - Public methods

    public func refreshCV() {
        loadingState = .refreshing
        loadCV()
    }

    public func requestCV() {
        loadingState = .loading
        loadCV()
    }

    // MARK: - Private methods

    private func loadCV() {
        self.dataTask = apiService.request(ApiEndpoint.profile, completion: { [weak self] (data, response, error) in
            self?.handleResponse(data: data, response: response, error: error)
        })
    }

    private func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard let jsonData = data, response != nil else {
            handleError(error, response: response, data: data)
            return
        }
        do {
            self.responseEntity = try JSONDecoder().decode(ProfileResponse.self, from: jsonData)
            loadingState = .loaded
        } catch {
            handleError(error, response: response, data: data)
        }
    }

    private func handleError(_ error: Error?, response: URLResponse?, data: Data?) {
        let error = error ?? Localization.Common.Error.unableToLoadProfile
        loadingState = .error(error)
        logService.write(.🆘, (response as? HTTPURLResponse)?.statusCode, data?.logDescription)
    }
}
