//
//  MemoryGame.swift
//  Memories
//
//  Created by Sergej on 18.1.22..
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards : [Card]
    
    private var indexOfOneAndOnlyFaceUpCard : Int?
    
    mutating func chooseCard(_ card : Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content ==  cards[potentialMatchedIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOFCards : Int, creatCardContent : (Int) -> CardContent){
        cards = [Card]()
        
        for pairIndex in 0...numberOfPairsOFCards-1 {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        var id: Int
    }

}

