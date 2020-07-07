//
//  Ingredient.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import Foundation

struct Ingredient: TestDataDecodable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "strIngredient1"
    }
}
