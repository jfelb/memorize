//
//  Theme.swift
//  Memorize
//
//  Created by Yulia Felberg on 13/05/2021.
//

import SwiftUI

enum Theme: CaseIterable {
    case savana
    case music
    case transportation
    case people
    case figures
    case food
    
    var name: String {
        switch self {
        case .transportation:
            return "Transportation"
        case .savana:
            return "Savana"
        case .music:
            return "Music"
        case .people:
            return "People"
        case .figures:
            return "Figures"
        case .food:
            return "Food"
        }
    }
    
    var emojis: [String] {
        switch self {
        case .transportation:
            return ["⛵️", "🚢", "⛴", "🚤", "🚀"]//, "✈️", "🚊", "🚄", "🛸"]
        case .savana:
            return ["🐵", "🐸", "🦁"]//, "🐯", "🐼", "🐷", "🐨", "🐮"]
        case .music:
            return ["🎺", "🎸", "🎷", "🎻"]//, "🪕", "🎹", "🎼"]
        case .people:
            return ["👵", "👩‍🦳", "🧑🏻‍🦰", "👱🏽‍♀️"]//, "👩🏼‍🦱", "👩🏼", "👶", "👩🏻‍🦰", "👨🏿‍🦰"]
        case .figures:
            return ["🧜🏽‍♂️", "🧚🏽‍♂️", "🧜🏾", "🧛🏽‍♀️"]//, "🧙🏽", "🦹🏻‍♂️", "🦸🏼‍♀️"]
        case .food:
            return ["🍪", "🍭", "🍩", "🍿", "🎂", "🍦", "🍛"]
        }
    }
    
    var numberOfCards: Int? {
        switch self {
        case .transportation:
            return nil
        case .savana, .music, .people, .figures, .food:
            return emojis.count
        }
    }
    
    var color: Color {
        switch self {
        case .transportation:
            return Color.black
        case .savana:
            return Color.green
        case .music:
            return Color.gray
        case .people:
            return Color.yellow
        case .figures:
            return Color.purple
        case .food:
            return Color.orange
        }
    }
}

