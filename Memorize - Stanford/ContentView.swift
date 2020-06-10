//
//  ContentView.swift
//  Memorize - Stanford
//
//  Created by taco on 6/1/20.
//  Copyright © 2020 tacoTruck. All rights reserved.
//  Lecture 1: https://www.youtube.com/watch?v=jbtqIBpUG7g
//  Lecture 2: https://www.youtube.com/watch?v=4GjXq2Sr55Q


import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        return HStack {    //HStack allows Views to be arranged from left to right
            ForEach(viewModel.cards) { card in   //loop used to create 4 identicle Views
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .foregroundColor(Color.orange)    //this method call will affect all Views within this stack
            .padding()  //this creates white space between the edge of the View and the shape
            .font(Font.largeTitle)  //this will set the font environment for all text within the stack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {    //ZStack allows Views to be stacked on top of eachother within the Z axis
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)   //stroke method call creates an outline of the shape created rather than creating a filled shape
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }

        }
    }
}
