//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcos Felipe Souza on 19/05/20.
//  Copyright © 2020 Marcos Felipe Souza. All rights reserved.
//

import SwiftUI

/// ViewModel in the project
final class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.defaultMemoryGame()
    
    static func defaultMemoryGame() -> MemoryGame<String> {
        let numberOfPairOfCards = Int.random(in: 3...4)
        let emojis = ["👻", "🎃", "🕷", "👽", "🧟‍♂️"]
        var memoryGame = MemoryGame<String>(numberOfPairOfCards: numberOfPairOfCards) { pairIndex in
            return emojis[pairIndex]
        }
        memoryGame.shuffling()
        return memoryGame
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        self.model.cards
    }
    
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
//        self.objectWillChange.send()
        self.model.choose(card: card)
    }
}
