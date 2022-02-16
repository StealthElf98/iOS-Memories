//
//  EmojiMemoryGameView.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    @State var emojiCount = 10
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio : 2/3, content: { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            }else {
                CardView(card : card)
                    .padding(4)
                    .onTapGesture {
                        game.chooseCard(card)
                    }
            }
        })
            .foregroundColor(.red)
            .padding(.horizontal)
        
    }
}

struct CardView : View {
    
    let card : EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadious)
                if card.isFaceUp {
                    
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 30), endAngle: Angle(degrees: 270))
                        .padding(3)
                        .opacity(0.55)
                    Text(card.content)
                        .font(font(in : geometry.size))
                }else if card.isMatched {
                    shape.opacity(0)
                }else {
                    shape.fill(.red)
                }
            }
        }
    }
    
    private func font(in size : CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadious : CGFloat = 10
        static let lineWidth : CGFloat = 2
        static let fontScale : CGFloat = 0.7
        
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.chooseCard(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
