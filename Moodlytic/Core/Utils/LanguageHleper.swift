//
//  LanguageHleper.swift
//  Moodlytic
//
//  Created by Atiq Alam on 24/01/26.
//
import SwiftUI

extension Text {
    init(text key: String) {
        self.init(LocalizedStringKey(key))
    }
}

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}



