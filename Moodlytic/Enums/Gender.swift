//
//  Gender.swift
//  Moodlytic
//
//  Created by Atiq Alam on 17/01/26.
//


import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    case other = "Other"

    var id: String { rawValue }
}
