//
//  ContentView.swift
//  Memorize - Stanford
//
//  Created by taco on 6/1/20.
//  Copyright © 2020 tacoTruck. All rights reserved.

//  Lecture 1: https://www.youtube.com/watch?v=jbtqIBpUG7g
//  Lecture 2: https://www.youtube.com/watch?v=4GjXq2Sr55Q
//  Homework: https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/a1.pdf
//  Lecture 3: https://www.youtube.com/watch?v=SIYdYpPXil4
//  Lecture 4: https://www.youtube.com/watch?v=eHEeWzFP6O4


import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame  // @ObservedObject property wrapper signifies this var contains an ObservableObject
    
    var body: some View {
        Grid(viewModel.cards) { card in   // this is explained at 3:00 of Lecture 4
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                        .aspectRatio(2/3, contentMode: .fit)    // this is the correct solution to homework requirement #3
                        .padding(5)
                }
        .foregroundColor(Color.orange)    //this method call will affect all Views within this stack
        .padding()  //this creates white space between the edge of the View and the shape
            }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {    //ZStack allows Views to be stacked on top of eachother within the Z axis
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)   //stroke method call creates an outline of the shape created rather than creating a filled shape
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    //MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3

    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}
