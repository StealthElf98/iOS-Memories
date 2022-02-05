//
//  EmojiMemoryGame.swift
//  Memories
//
//  Created by Sergej on 18.1.22..
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    
    static let dictionary : [Int : [String]] = [
        0 : ["✈️","🚝", "🚈", "🚘", "🚖", "🚊", "🛻","🚠", "🛵", "🛺", "🚔", "🚚", "🚁", "🏍", "🚃", "🚑", "🚓", "🛩", "🛳", "⛵️", "🛬", "🚠"],
        1 : ["👩🏼‍🦰", "👨🏼‍🦳", "👱🏼‍♀️", "👽", "🤦🏻‍♂️", "🧛🏻‍♂️", "👶🏻", "🧚‍♀️", "💃🏼", "🧕🏾"],
        2 : ["🍒", "🍓", "🍑", "🍌", "🥥", "🥑", "🍍", "🍇", "🍋", "🫐"],
        3 : ["🍆", "🥒", "🥕", "🌶", "🌽", "🥦", "🍅", "🧅", "🧄", "🫑"]
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(chooseTheme: chooseTheme)
    }
    
    static func chooseTheme() -> MemoryGame<String>.Theme {
        var theme : MemoryGame<String>.Theme = MemoryGame<String>.Theme()
        let num = Int.random(in: 0...3)
        
        switch num {
        case 0 :
            theme.cardsToShow = 10
            theme.color = .red
            theme.emojis = dictionary[0] ?? []
            theme.name = "vehicles"
            theme.cards = []
        case 1 :
            theme.cardsToShow = 10
            theme.color = .blue
            theme.emojis = dictionary[1] ?? []
            theme.name = "people"
        case 2 :
            theme.cardsToShow = 10
            theme.color = .orange
            theme.emojis = dictionary[2] ?? []
            theme.name = "fruits"
        case 3 :
            theme.cardsToShow = 10
            theme.color = .green
            theme.emojis = dictionary[3] ?? []
            theme.name = "vegetables"
        default:
            return theme
        }
        
        createCardContent(theme: &theme)
        theme.cards.shuffle()
        
        return theme
    }
    
    static func createCardContent(theme : inout MemoryGame<String>.Theme){
    
        for pairIndex in 0...theme.cardsToShow - 1{
            theme.cards.append(MemoryGame<String>.Card(content: theme.emojis[pairIndex], id: pairIndex*2))
            theme.cards.append(MemoryGame<String>.Card(content: theme.emojis[pairIndex], id: pairIndex*2+1))
        }
    }
    
    
    @Published private var model = createMemoryGame()
    
    var theme : MemoryGame<String>.Theme {
        return model.theme
    }
    
    //MARK: - Intents
    
    func chooseCard(_ card : MemoryGame<String>.Card){
        model.chooseCard(card)
    }
    
    func startNewGame(){
        model.startNewGame(chooseTheme: EmojiMemoryGame.chooseTheme)
    }
    
    func getPoints() -> Int {
        model.points
    }
}

