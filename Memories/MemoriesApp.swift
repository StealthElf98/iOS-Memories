//
//  MemoriesApp.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

@main
struct MemoriesApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
