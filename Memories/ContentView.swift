//
//  ContentView.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    @State var emojiCount = 19
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
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
    
    let card : MemoryGame<String>.Card
    
    var body: some View {
        
        let shape = RoundedRectangle(cornerRadius: 25)
        
        ZStack {
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                .font(.largeTitle)
            }else if card.isMatched {
                shape.opacity(0)
            }else {
                shape.fill(.red)
            }
        }
        
        
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)

    }
}
