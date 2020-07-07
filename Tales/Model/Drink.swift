//
//  Drink.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import Foundation

struct Drink: TestDataDecodable {
    let name: String
    let thumbNailURLStr: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case thumbNailURLStr = "strDrinkThumb"
        case id = "idDrink"
    }
}
