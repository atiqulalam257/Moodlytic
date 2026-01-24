//
//  AppColors.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//



import SwiftUI

enum AppColors {

    static let primary = adaptive(
        light: "#5B7CFA",
        dark:  "#8FA2FF"
    )

    static let secondary = adaptive(
        light: "#9AA9FF",
        dark:  "#6B7CFF"
    )

    static let background = adaptive(
        light: "#F4F6FF",
        dark:  "#0F172A"
    )

    static let card = adaptive(
        light: "#FFFFFF",
        dark:  "#1E293B"
    )

    static let textPrimary = adaptive(
        light: "#1F2937",
        dark:  "#E5E7EB"
    )

    static let textSecondary = adaptive(
        light: "#6B7280",
        dark:  "#94A3B8"
    )

    static let divider = adaptive(
        light: "#E5E7EB",
        dark:  "#334155"
    )

    static let success = adaptive(
        light: "#4ADE80",
        dark:  "#22C55E"
    )

    static let warning = adaptive(
        light: "#FACC15",
        dark:  "#EAB308"
    )

    static let danger = adaptive(
        light: "#F87171",
        dark:  "#EF4444"
    )

    // MARK: - Helper
    private static func adaptive(
        light: String,
        dark: String
    ) -> Color {
        Color(
            UIColor { trait in
                trait.userInterfaceStyle == .dark
                ? UIColor(Color(hex: dark))
                : UIColor(Color(hex: light))
            }
        )
    }
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


