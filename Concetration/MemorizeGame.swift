//
//  MemorizeGame.swift
//  Concetration
//
//  Created by Matan Shaumberg on 19/04/2024.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    var indexOfOneFacedUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set {
            for index in cards.indices { cards[index].isFaceUp = index == newValue }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let indexOfOneFacedUpCard {
                    if cards[indexOfOneFacedUpCard].Content == cards[chosenIndex].Content {
                        cards[indexOfOneFacedUpCard].isMatched = true
                        cards[chosenIndex].isMatched = true
                        score += 2
                    } else {
                        score += (cards[indexOfOneFacedUpCard].penalty() + cards[chosenIndex].penalty())
                        cards[chosenIndex].wasSeenBefore = true
                        cards[indexOfOneFacedUpCard].wasSeenBefore = true
                    }
                } else {
                    indexOfOneFacedUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(Content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(Content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
    }
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            "\(id): \(Content) \(isFaceUp ? "up" : "down")"
        }
        
        var isFaceUp = false
        var isMatched = false
        var wasSeenBefore = false
        let Content: CardContent
        
        var id: String
        
        func penalty() -> Int {
            wasSeenBefore ? -1 : 0
        }
    }
}
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
