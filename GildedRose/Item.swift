//
//  Item.swift
//  GildedRose
//
//  Created by Milan Anusjak on 12/09/2022.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var sellIn: Int
    var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        "\(name), \(sellIn), \(quality)"
    }
}
