//
//  GeneralInfoPresenter.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

extension Constants.Landing {
    static let phoneUrlFormat: String = "tel://%@"
    static let mailUrlFormat: String  = "mailto:%@"
    static let mapsBaseUrlString: String = "http://maps.apple.com/?q="
}

class GeneralInfoPresenter {

    // MARK: - Properties

    private unowned let router: ProfileRouterDelegate
    private let contactEntity: ContactEntity
    public let headerPresenter: LandingHeaderPresenter

    public var address: String {
        return [contactEntity.street, contactEntity.countryPostcode].joined(separator: String.comma + String.space)
    }

    public var phone: String {
        return contactEntity.phone
    }

    public var email: String {
        return contactEntity.email
    }

    public var phoneUrlString: String {
        return String(format: Constants.Landing.phoneUrlFormat, phone.digits)
    }

    public var mailUrlString: String {
        return String(format: Constants.Landing.mailUrlFormat, email)
    }

    public var addressUrlString: String? {
        if let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            return Constants.Landing.mapsBaseUrlString + encodedAddress
        }
        return nil
    }

    // MARK: - Lifecycle

    public init(router: ProfileRouterDelegate, contactEntity: ContactEntity, headerPresenter: LandingHeaderPresenter) {
        self.router = router
        self.contactEntity = contactEntity
        self.headerPresenter = headerPresenter
    }
}
