//
//  DateFormatter+Ext.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//

import Foundation

extension DateFormatter {

    // Full date style: Monday, December 28, 2025
    static let fullDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        formatter.locale = Locale.current
        return formatter
    }()

    // Short date style: 28 Dec 2025
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale.current
        return formatter
    }()

    // Custom: yyyy-MM-dd
    static let isoDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale.current
        return formatter
    }()
}
