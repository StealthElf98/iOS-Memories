//
//  MemoryGame.swift
//  Memories
//
//  Created by Sergej on 18.1.22..
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var theme : Theme
    private(set) var points : Int = 0
    
    private var indexOfOneAndOnlyFaceUpCard : Int?
    
    mutating func chooseCard(_ card : Card){
        if let chosenIndex = theme.cards.firstIndex(where: { $0.id == card.id }),
           !theme.cards[chosenIndex].isFaceUp,
           !theme.cards[chosenIndex].isMatched
        {
            if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard {
                if theme.cards[chosenIndex].content ==  theme.cards[potentialMatchedIndex].content{
                    theme.cards[chosenIndex].isMatched = true
                    theme.cards[potentialMatchedIndex].isMatched = true
                    points += 2
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in theme.cards.indices {
                    theme.cards[index].isFaceUp = false
                }
                
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            if theme.cards[chosenIndex].alreadyBeenSeen == true {
                points -= 1
            } else {
                theme.cards[chosenIndex].alreadyBeenSeen.toggle()
            }
            theme.cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func startNewGame(chooseTheme : () -> Theme){
        theme = chooseTheme()
        points = 0
    }
    
    init(chooseTheme : () -> Theme){
        theme = chooseTheme()
    }
    
    struct Card: Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var alreadyBeenSeen : Bool = false
        var content : CardContent
        var id: Int
    }
    
    struct Theme {
        var name : String = "vehicles"
        var emojis : [String] = ["✈️","🚝", "🚈", "🚘", "🚖", "🚊", "🛻","🚠", "🛵", "🛺", "🚔", "🚚", "🚁", "🏍", "🚃", "🚑", "🚓", "🛩", "🛳", "⛵️", "🛬", "🚠"]
        var cardsToShow : Int = 6
        var color : Color = .red
        var cards : [Card] = []
    }

}

