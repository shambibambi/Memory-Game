//
//  String+Extensions.swift
//  Concetration
//
//  Created by Matan Shaumberg on 28/04/2024.
//

import Foundation
import SwiftUI
extension String {
    func toColor() -> Color {
        switch self {
        case "Orange": return .orange
        case "Brown": return .brown
        case "Red": return .red
        case "Blue": return .blue
        case "Gray": return .gray
        case "Green": return .green
        default: return .pink
        }
    }
}
