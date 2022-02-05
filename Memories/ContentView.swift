//
//  ContentView.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    viewModel.startNewGame()
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 40))
                    
                })
                    .frame(width: 50, height: 50)
                Spacer()
                Text("Memorize!")
                    .font(.largeTitle)
                Spacer()
                Text("\(viewModel.getPoints())")
                    .font(.largeTitle)
                Spacer()
            }
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(viewModel.theme.cards) { card in
                        CardView(card: card, theme : viewModel.theme)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.theme.color)
            
        }
        .padding(.horizontal)
        
    }
}

struct CardView : View {
    
    let card : MemoryGame<String>.Card
    let theme : MemoryGame<String>.Theme
    
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
                shape.fill(theme.color)
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
