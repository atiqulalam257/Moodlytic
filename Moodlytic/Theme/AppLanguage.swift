//
//  AppLanguage.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//

import Foundation


enum AppLanguage: String, CaseIterable {
    case english = "en"
    case arabic = "ar"

    var locale: Locale {
        Locale(identifier: rawValue)
    }
}

