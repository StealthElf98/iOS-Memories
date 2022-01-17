//
//  ContentView.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["✈️","🚝", "🚈", "🚘", "🚖", "🚊"]
    @State var emojiCount = 5
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0...emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                cars
                Spacer()
                persons
                Spacer()
                square
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var persons : some View {
        Button {
            emojiCount = Int.random(in: 1...5)
            emojis = ["🤦🏼‍♀️", "👨🏻‍🦰", "👱🏼‍♀️", "🧍🏼‍♂️", "👱🏿‍♂️", "👨🏼‍🦳", "👽"]
                .shuffled()
        }label: {
            VStack{
                Image(systemName: "person")
                Text("People")
                    .font(.title2)
            }
        }
        
    }
    
    var square : some View {
        Button {
            emojiCount = Int.random(in: 1...5)
            emojis = ["🔴", "🟩", "🌙", "🔶", "🔻", "🔺", "💠"]
                .shuffled()
        }label: {
            VStack{
                Image(systemName: "square")
                Text("Shapes")
                    .font(.title2)
            }
        }
        
    }
    
    var cars : some View {
        Button(action: {
            emojiCount = Int.random(in: 1...5)
            emojis = ["✈️","🚝", "🚈", "🚘", "🚖", "🚊"]
                .shuffled()
        }, label: {
            VStack{
                Image(systemName: "car")
                Text("Transport")
                    .font(.title2)
            }
        })
    }
}

struct CardView : View {
    var content : String
    @State var isFaceUp : Bool = true
    
    var body: some View {
        
        let shape = RoundedRectangle(cornerRadius: 25)
        
        ZStack {
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
            Text(content)
                .font(.largeTitle)
            }else {
                shape.fill(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)

    }
}
