//
//  AppColors.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//



import SwiftUI
enum AppColors {

    static let primary = Color(hex: "#5B7CFA")
    static let secondary = Color(hex: "#9AA9FF")

    static let background = Color(hex: "#F4F6FF")
    static let card = Color(hex: "#FFFFFF")

    static let textPrimary = Color(hex: "#1F2937")
    static let textSecondary = Color(hex: "#6B7280")

    static let divider = Color(hex: "#E5E7EB")

    static let success = Color(hex: "#4ADE80")
    static let warning = Color(hex: "#FACC15")
    static let danger = Color(hex: "#F87171")
}

extension SwiftUI.Color {

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: UInt64
        switch hex.count {
        case 6:
            (r, g, b, a) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8:
            (r, g, b, a) = (int >> 24 & 0xFF, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


