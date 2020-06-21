//
//  MemoryGame.swift
//  Memorize - Stanford
//
//  Created by taco on 6/9/20.
//  Copyright © 2020 tacoTruck. All rights reserved.
//  Lecture 1: https://www.youtube.com/watch?v=jbtqIBpUG7g
//  Lecture 2: https://www.youtube.com/watch?v=4GjXq2Sr55Q
//  Homework: https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/a1.pdf
//  Lecture 3: https://www.youtube.com/watch?v=SIYdYpPXil4

import Foundation

struct MemoryGame<CardContent> {

    
    var cards: Array<Card>
    
    mutating func choose(card: Card) {      //  mutating keyword indicates this function will modify self
        print("card chosen: \(card)")
        
        let chosenIndex: Int = cards.firstIndex(matching: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
      
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()     // this satisfies homework requirement #2
        if (numberOfPairsOfCards < 5) {
            
        }
    }
    
    struct Card: Identifiable {     // Identifiable is a protocol, which allows the Card struct to gain the ability to be identified within the ForEach loop of the HStack View
        var isFaceUp: Bool = true      // initializing values allows us to avoid having to provide these values to constructor calls as seen above
        var isMatched: Bool = false
        var content: CardContent
        var id: Int     // a dedicated Int var must be provided in order to conform to the Identifiable protocol
        
    }
}
