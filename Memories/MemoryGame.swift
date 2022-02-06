//
//  MemoryGame.swift
//  Memories
//
//  Created by Sergej on 18.1.22..
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards : [Card]
    
    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            // var faceUpCardIndices = cards.indices.filter({ index in cards[index].isFaceUp }) cards[$0].isFaceUp
            cards.indices.filter({ index in cards[index].isFaceUp }).oneAndOnly
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
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
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    init(numberOfPairsOFCards : Int, creatCardContent : (Int) -> CardContent){
        cards = []
        
        for pairIndex in 0...numberOfPairsOFCards-1 {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content : CardContent
        let id: Int
    }
    
}


extension Array {
    var oneAndOnly : Element? {
        if count == 1 { // self.count
            return first //self.first
        } else {
            return nil
        }
    }
}
