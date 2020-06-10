//
//  MemoryGame.swift
//  Memorize - Stanford
//
//  Created by taco on 6/9/20.
//  Copyright © 2020 tacoTruck. All rights reserved.
//  Lecture 2: https://www.youtube.com/watch?v=4GjXq2Sr55Q

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
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
