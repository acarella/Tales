//
//  Get.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import Foundation

enum Get: ApiRequest {
    case ingredientsList
    case drinkList(String)
    case recipe(String)

    var path: String {
        let p: String
        switch self {
        case .ingredientsList:
            p = "/list.php"
        case .drinkList:
            p = "/filter.php"
        case .recipe:
            p = "/lookup.php"
        }

        return p.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .ingredientsList:
            return [URLQueryItem(name: "i", value: "list")]
        case .drinkList(let ingredient):
            return [URLQueryItem(name: "i", value: ingredient)]
        case .recipe(let id):
            return [URLQueryItem(name: "i", value: id)]
        }

    }

    var dedableType: Decodable.Type {
        switch self {
        case .ingredientsList:
            return IngredientList.self
        case .drinkList:
            return DrinkList.self
        case .recipe:
            return RecipeList.self
        }
    }

    var httpMethod: String {
        return "GET"
    }
}
