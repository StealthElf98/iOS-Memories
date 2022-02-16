//
//  EmojiMemoryGame.swift
//  Memories
//
//  Created by Sergej on 18.1.22..
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["✈️","🚝", "🚈", "🚘", "🚖", "🚊", "🛻","🚠", "🛵", "🛺", "🚔", "🚚", "🚁", "🏍", "🚃", "🚑", "🚓", "🛩", "🛳", "⛵️", "🛬", "🚠"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOFCards: 10) { pairIndex in
                emojis[pairIndex]
        }
    }
    
    
   @Published private var model = createMemoryGame()
    
    var cards : [Card] {
        return model.cards
    }
    
    //MARK: - Intents
    
    func chooseCard(_ card : Card){
        model.chooseCard(card)
    }
}
