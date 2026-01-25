//
//  Gender.swift
//  Moodlytic
//
//  Created by Atiq Alam on 17/01/26.
//


import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male
    case female
    case other

    var id: String { rawValue }

    var title: String {
        switch self {
        case .male:
            return StringHelper.gender_male.localized
        case .female:
            return StringHelper.gender_female.localized
        case .other:
            return StringHelper.gender_other.localized
        }
    }
}

