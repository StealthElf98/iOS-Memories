//
//  MemoriesApp.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

@main
struct MemoriesApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
