//
//  EmojiMemoryGame.swift
//  Concetration
//
//  Created by Matan Shaumberg on 19/04/2024.
//

import SwiftUI
class EmojiMemoryGame: ObservableObject {
    
    private static func createMemoryGame(with theme: Themes.GameTheme) -> MemoryGame<String> {
        let shuffledEmojis = theme.emojis.shuffled()
        return MemoryGame(
            numberOfPairsOfCards: theme.numberOfPairs) { index in
                if shuffledEmojis.indices.contains(index) {
                    return shuffledEmojis[index]
                } else {
                    return "😬"
                }
            }
    }
    
    @Published
    var theme: Themes.GameTheme
    @Published
    private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        model.score
    }
    
    init() {
        let theme = Themes.themes.randomElement() ?? Themes.themes[0]
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let theme = Themes.themes.randomElement() ?? Themes.themes[0]
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    func getColor() -> Color {
        theme.colorName.toColor()
    }
}
