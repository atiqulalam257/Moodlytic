//
//  AppFont.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//


import SwiftUI

enum AppFont {

    static func h1() -> Font {
        .system(size: 28, weight: .bold, design: .rounded)
    }

    static func h2() -> Font {
        .system(size: 22, weight: .semibold, design: .rounded)
    }
    static func h3() -> Font {
        .system(size: 18, weight: .semibold, design: .rounded)
    }

    static func body() -> Font {
        .system(size: 16, weight: .regular, design: .rounded)
    }

    static func caption() -> Font {
        .system(size: 13, weight: .regular, design: .rounded)
    }

    static func button() -> Font {
        .system(size: 17, weight: .semibold, design: .rounded)
    }
}
