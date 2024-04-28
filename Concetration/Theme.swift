//
//  Theme.swift
//  Concetration
//
//  Created by Matan Shaumberg on 27/04/2024.
//

import Foundation
struct Themes {
    
    static let themes = [
        GameTheme(emojis: ["🎃", "👻", "💀", "👹"], numberOfPairs: 4, colorName: "Orange", title: "Halloween"),
        GameTheme(emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻"], numberOfPairs: 7, colorName: "Brown", title: "Animals"),
        GameTheme(emojis: ["🍕", "🍔", "🌭", "🍟", "🍗", "🥪", "🍣"], numberOfPairs: 7, colorName: "Red", title: "Fast Food"),
        GameTheme(emojis: ["🌈", "☁️", "☀️", "🌤️", "⛅", "🌧️", "🌩️", "❄️", "🌪️"], numberOfPairs: 9, colorName: "Blue", title: "Weather"),
        GameTheme(emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒"], numberOfPairs: 9, colorName: "Gray", title: "Vehicles"),
        GameTheme(emojis: ["🍇", "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🥭", "🍎", "🍏"], numberOfPairs: 10, colorName: "Green", title: "Fruits")
    ]
    
    struct GameTheme {
        private(set) var emojis: Array<String>
        private(set) var numberOfPairs: Int
        private(set) var colorName: String
        private(set) var title: String
    }
}

