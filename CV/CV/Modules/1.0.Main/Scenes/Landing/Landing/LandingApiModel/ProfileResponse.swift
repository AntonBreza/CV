//
//  ProfileResponse.swift
//  CV
//
//  Created by Anton Breza Dev on 9/25/19.
//  Copyright © 2019 Anton Breza Dev. All rights reserved.
//

import Foundation

// MARK: - ProfileResponse

struct ProfileResponse: Codable {
    let person: PersonEntity
    let contact: ContactEntity
    let education: [EducationEntity]
    let employmentHistory: [EmploymentHistory]
    let skills: [SkillEntity]
    let languages: [Language]
}

// MARK: - ContactEntity

struct ContactEntity: Codable {
    let street, countryPostcode, phone, email: String
}

// MARK: - EducationEntity

struct EducationEntity: Codable {
    let organization, result, graduation: String
}

// MARK: - EmploymentHistory

struct EmploymentHistory: Codable {
    let organization, position, period, generalInfo: String
    let employmentHistoryDescription: String

    enum CodingKeys: String, CodingKey {
        case organization, position, period, generalInfo
        case employmentHistoryDescription = "description"
    }
}

// MARK: - Language

struct Language: Codable {
    let title, level: String
}

// MARK: - PersonEntity

struct PersonEntity: Codable {
    let name, position, dateOfBirth: String
}

// MARK: - Skill

struct SkillEntity: Codable {
    let programmingLanguages, taskTrackingTools, architecturePatterns, frameworks: [String]
    let developmentTools: [String]

    var skills: [(String, [String])] {
        guard let dictionary = self.dictionary as? [String : [String]] else {
            return [(String, [String])]()
        }
        return dictionary.map { ($0.key, $0.value) }
    }
}
