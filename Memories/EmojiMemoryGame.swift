//
//  EmojiMemoryGame.swift
//  Memories
//
//  Created by Sergej on 18.1.22..
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    
    static let emojis = ["✈️","🚝", "🚈", "🚘", "🚖", "🚊", "🛻","🚠", "🛵", "🛺", "🚔", "🚚", "🚁", "🏍", "🚃", "🚑", "🚓", "🛩", "🛳", "⛵️", "🛬", "🚠"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOFCards: 4) { pairIndex in
                emojis[pairIndex]
        }
    }
    
    
   @Published private var model = createMemoryGame()
    
    var cards : [MemoryGame<String>.Card] {
        return model.cards
    }
    
    //MARK: - Intents
    
    func chooseCard(_ card : MemoryGame<String>.Card){
        model.chooseCard(card)
    }
}
