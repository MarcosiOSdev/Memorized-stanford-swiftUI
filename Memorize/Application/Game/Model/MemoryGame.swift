//
//  MemoryGame.swift
//  Memorize
//
//  Created by Marcos Felipe Souza on 19/05/20.
//  Copyright © 2020 Marcos Felipe Souza. All rights reserved.
//

import Foundation

/// MemoryGame contem  o CardContent pq o Card.content pode ser Int, String, Image e Any.
struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfThenOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        
        if let choosenIndex = cards.firstIndex(matching: card),
            !cards[choosenIndex].isFaceUp,
            !cards[choosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfThenOneAndOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[choosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[choosenIndex].isMatched = true
                }
                
                cards[choosenIndex].isFaceUp = true
            } else {
                indexOfThenOneAndOnlyFaceUpCard = choosenIndex
            }
            
        }
    }
    
    mutating func shuffling() {
        self.cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
