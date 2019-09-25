//
//  ImageService.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import UIKit

public typealias ImageCompletion = (UIImage?) -> Void

public class ImageService {

    // MARK: - Properties

    private var imageCache = [URL : UIImage]()
    private let recursiveLock = NSRecursiveLock()

    private let apiService: ApiService
    private let logService: LogService

    // MARK: - Lifecycle

    init(apiService: ApiService, logService: LogService) {
        self.apiService = apiService
        self.logService = logService
    }

    // MARK: - Public methods

    @discardableResult
    public func loadImage(_ urlConvertible: URLConvertible, completion: @escaping ImageCompletion) -> URLSessionTask?  {
        if let image = retrivedImage(urlConvertible) {
            completion(image)
            return nil
        }
        return apiService.request(urlConvertible) { [weak self] (data, response, error) in
            if let imageData = data, let image = UIImage(data: imageData) {
                completion(image)
                self?.storeImage(urlConvertible, image: image)
                return
            }
            self?.logService.write(.🆘, (response as? HTTPURLResponse)?.statusCode, data?.logDescription)
            completion(nil)
        }
    }

    // MARK: - Private methods

    private func retrivedImage(_ urlConvertible: URLConvertible) -> UIImage? {
        recursiveLock.lock(); defer { recursiveLock.unlock() }
        if let url = try? urlConvertible.asURL() {
            return imageCache[url]
        }
        return nil
    }

    private func storeImage(_ urlConvertible: URLConvertible, image: UIImage){
        recursiveLock.lock(); defer { recursiveLock.unlock() }
        if let url = try? urlConvertible.asURL() {
            imageCache[url] = image
        }
    }
}
