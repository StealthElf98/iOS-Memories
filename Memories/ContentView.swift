//
//  ContentView.swift
//  Memories
//
//  Created by Sergej on 16.1.22..
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚝", "🥲", "🤌", "🤡"]
    var emojiCount = 3
    
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0...emojiCount], id: \.self, content: { emoji in
                    CardView(content: emoji)
                })
            }
            Button(action: {}, label: {
                VStack{
                    Text("Add")
                    Text("Card")
                }
            })
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
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
                shape.stroke(lineWidth: 6)
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
