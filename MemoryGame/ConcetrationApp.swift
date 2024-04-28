//
//  ConcetrationApp.swift
//  Concetration
//
//  Created by Matan Shaumberg on 16/03/2024.
//

import SwiftUI

@main
struct ConcetrationApp: App {
    @StateObject var viewModel = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: viewModel)
        }
    }
}
