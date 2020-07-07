//
//  TestDataDecodable.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import Foundation

protocol TestDataDecodable: Decodable {
    static var testJSONFileName: String { get }
    static var testData: Self { get }
}

extension TestDataDecodable {

    // json files must be named the same as the type
    // e.g. for Drink, "Drink.json"
    static var testJSONFileName: String {
        return "\(type(of: self)).json"
    }

    static var testData: Self {
        return load(Self.testJSONFileName)
    }
}
