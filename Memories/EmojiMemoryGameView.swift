//
//  EmojiMemoryGameView.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    @State var emojiCount = 19
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(game.cards) { card in
                        CardView(card : card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.chooseCard(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            
        }
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
        static let cornerRadious : CGFloat = 20
        static let lineWidth : CGFloat = 2
        static let fontScale : CGFloat = 0.8
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)

    }
}
