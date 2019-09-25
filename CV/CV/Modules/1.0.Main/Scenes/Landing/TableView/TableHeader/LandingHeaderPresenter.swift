//
//  LandingHeaderPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

class LandingHeaderPresenter {

    // MARK: - Propeties

    private let imageService: ImageService
    private var task: URLSessionTask?

    public weak var view: LandingHeader? {
        didSet {
            view?.setup(with: personEntity)
            loadImage()
        }
    }

    public var personEntity: PersonEntity? {
        didSet {
            view?.setup(with: personEntity)
            loadImage()
        }
    }

    // MARK: - Lifecycle

    init(imageService: ImageService) {
        self.imageService = imageService
    }

    // MARK: - Public methods

    public func loadImage() {
        guard task?.currentRequest?.url != (try? ApiEndpoint.photo.asURL()) else {
            return
        }
        self.task = imageService.loadImage(ApiEndpoint.photo) { [weak self] (image) in
            DispatchQueue.main.async {
                self?.view?.updateImage(image)
                self?.task = nil
            }
        }
    }
}
