//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yulia Felberg on 27/04/2021.
//

import Foundation

//ViewModel

func createCardContent(pairIndex: Int) -> String {
    return "🧚🏼"
}
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    static var currentTheme: Theme = .figures
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let themes: [Theme] = Theme.allCases
        let themeIndex = Int.random(in: 0..<themes.count)
        EmojiMemoryGame.currentTheme = themes[themeIndex]
        let numberOfPairsOfCards = EmojiMemoryGame.currentTheme.emojis.count
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            return EmojiMemoryGame.currentTheme.emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }

    //MARK: - Intents
    
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
