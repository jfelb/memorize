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
            return ["â”ïž", "đą", "âŽ", "đ€", "đ"]//, "âïž", "đ", "đ", "đž"]
        case .savana:
            return ["đ”", "đž", "đŠ"]//, "đŻ", "đŒ", "đ·", "đš", "đź"]
        case .music:
            return ["đș", "đž", "đ·", "đ»"]//, "đȘ", "đč", "đŒ"]
        case .people:
            return ["đ”", "đ©âđŠł", "đ§đ»âđŠ°", "đ±đœââïž"]//, "đ©đŒâđŠ±", "đ©đŒ", "đ¶", "đ©đ»âđŠ°", "đšđżâđŠ°"]
        case .figures:
            return ["đ§đœââïž", "đ§đœââïž", "đ§đŸ", "đ§đœââïž"]//, "đ§đœ", "đŠčđ»ââïž", "đŠžđŒââïž"]
        case .food:
            return ["đȘ", "đ­", "đ©", "đż", "đ", "đŠ", "đ"]
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

