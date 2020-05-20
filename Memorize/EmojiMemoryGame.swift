//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcos Felipe Souza on 19/05/20.
//  Copyright © 2020 Marcos Felipe Souza. All rights reserved.
//

import SwiftUI

/// ViewModel in the project
final class EmojiMemoryGame {
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.defaultMemoryGame
    
    static let defaultMemoryGame: MemoryGame<String> = {
        let numberOfPairOfCards = Int.random(in: 3...4)
        let emojis = ["👻", "🎃", "🕷", "👽", "🧟‍♂️"]
        return MemoryGame<String>(numberOfPairOfCards: numberOfPairOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }()
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards.shuffled()
    }
    
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
