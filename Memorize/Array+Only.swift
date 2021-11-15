//
//  Array+Only.swift
//  Memorize
//
//  Created by Yulia Felberg on 10/05/2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
