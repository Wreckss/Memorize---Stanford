//
//  EmojiMemoryGame.swift
//  Memorize - Stanford
//
//  Created by taco on 6/9/20.
//  Copyright © 2020 tacoTruck. All rights reserved.
//
//  THIS CLASS ACTS AS OUR VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    //this model variable becomes a closure by "inlining" a function by including the return value within curly brackets as a parameter
    @Published private var gameModel: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()   // @Published property wrapper negates the need for objectWillChange.send() calls by adding automatic publishing functionality to the gameModel var
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","💩","💀","🤖"]
        
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in       // Int.random was used to satisfy homework requirement #4
            return emojis[pairIndex]
        }
    }
    
    
    //  MARK: - Access to the model functions
    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards
    }
    
    //  MARK: - User intention functions
    func choose(card: MemoryGame<String>.Card) {
//        objectWillChange.send()         // objectWillChange is gained from ObservableObject, send() tells the View to update, this becomes unneccesary after adding @Published to the                                             gameModel var
        gameModel.choose(card: card)
    }
    
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
