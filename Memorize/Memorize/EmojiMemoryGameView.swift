//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Yulia Felberg on 26/04/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    Button("New Game") {
                        withAnimation(.easeInOut) { //explicit animation
                            viewModel.resetGame()
                        }
                    }
                    Text("Score:")
                    Text("\(viewModel.score)")
                }
                Divider()
                Text("\(EmojiMemoryGame.currentTheme.name)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(EmojiMemoryGame.currentTheme.color)

            }
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear) {
                        viewModel.chooseCard(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(EmojiMemoryGame.currentTheme.color)
        }
    }
}
    
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining*3)) {
            animatedBonusRemaining = 0
        }
    }
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90))
                            .onAppear {
                                startBonusAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90))
                    }
                }
                .padding(5).opacity(0.4)
                
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size))).rotationEffect(Angle.degrees(card.isMatched ? 360 : 0)).animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)       //implicit animation
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)//use offset to fly away
        }
    }
    
    //MARK: - Drawing Constants
    
    private let fontScaleFactor: CGFloat = 0.7
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.chooseCard(card: game.cards[1])
        return EmojiMemoryGameView(viewModel: game)
    }
}
