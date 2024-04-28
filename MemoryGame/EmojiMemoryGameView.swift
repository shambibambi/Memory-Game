//
//  EmojiMemoryGameView.swift
//  Concetration
//
//  Created by Matan Shaumberg on 16/03/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        viewModel.newGame()
                    }) {
                        Text("New Game")
                            .foregroundStyle(.white)
                            .padding(8)
                    }
                    .background(viewModel.getColor())
                    .cornerRadius(10)
                    Spacer()
                    Text("Score: \(viewModel.score)")
                }
                Text(viewModel.theme.title).font(.title)
            }
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
        }
        .padding()
        .foregroundStyle(viewModel.getColor())
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 85), spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                cardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
            .foregroundStyle(viewModel.getColor())
        }
    }
    
}

struct cardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.Content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }.opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
