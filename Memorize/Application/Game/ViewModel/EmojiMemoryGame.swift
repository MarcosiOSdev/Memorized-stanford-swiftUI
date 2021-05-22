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
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        // Sempre que mudar a model vai chamar o objectWillChange.send()
        // Isso faz com que aconteca um redraw na view.
//        objectWillChange.send()
        model.choose(card: card)
    }
}
