//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Marcos Felipe Souza on 19/05/20.
//  Copyright © 2020 Marcos Felipe Souza. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
//            .aspectRatio(2/3, contentMode: .fit)
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    /// Function for remove self.
    @ViewBuilder
    private func body(for size: CGSize) -> some View {

            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineAngle)
                    //Angle(degrees: 0) começa do lado direito e não emcima.
                    Pie(startAngle: Angle(degrees: 0-90),
                        endAngle: Angle(degrees: 150-90),
                        clockwise: true)
                        .padding(4)
                        .opacity(0.4)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }.font(Font.system(size: fontSize(for: size)))
    }
    
    //MARK: - Constants
    private let edgeLineAngle: CGFloat = 3
    private let cornerRadius: CGFloat = 10
    private let fontScaleFactor: CGFloat = 0.7
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
