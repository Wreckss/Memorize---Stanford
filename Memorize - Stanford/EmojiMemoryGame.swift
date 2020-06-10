//
//  EmojiMemoryGame.swift
//  Memorize - Stanford
//
//  Created by taco on 6/9/20.
//  Copyright © 2020 tacoTruck. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    
    //this model variable becomes a closure by "inlining" a function by including the return value within curly brackets as a parameter
    private var gameModel: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //  MARK: - Access to the model functions
    var cards: Array<MemoryGame<String>.Card> {
        gameModel.cards.shuffled()      // shuffled() satisfies the first homework requirement
    }
    
    //  MARK: - User intention functions
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
    
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
