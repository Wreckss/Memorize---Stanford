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
        
        let chosenIndex: Int = self.index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {      //  the dual parameter name allows this function to have an external call to of: and an internal call to card:
        for index in 0..<cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0    //  TODO: this is a bogus return
    }
    
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {     // Identifiable is a protocol, which allows the Card struct to gain the ability to be identified within the ForEach loop of the HStack View
        var isFaceUp: Bool = true      // initializing values allows us to avoid having to provide these values to constructor calls as seen above
        var isMatched: Bool = false
        var content: CardContent
        var id: Int     // a dedicated Int var must be provided in order to conform to the Identifiable protocol
        
    }
}
