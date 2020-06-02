//
//  ContentView.swift
//  Memorize - Stanford
//
//  Created by taco on 6/1/20.
//  Copyright © 2020 tacoTruck. All rights reserved.
//  Lecture 1: https://www.youtube.com/watch?v=jbtqIBpUG7g&feature=youtu.be


import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack {    //HStack allows Views to be arranged from left to right
            ForEach(0..<4) { index in   //loop used to create 4 identicle Views
                CardView(isFaceUp: false)
            }
        }
            .foregroundColor(Color.orange)    //this method call will affect all Views within this stack
            .padding()  //this creates white space between the edge of the View and the shape
            .font(Font.largeTitle)  //this will set the font environment for all text within the stack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {    //ZStack allows Views to be stacked on top of eachother within the Z axis
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)   //stroke method call creates an outline of the shape created rather than creating a filled shape
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }

        }
    }
}
