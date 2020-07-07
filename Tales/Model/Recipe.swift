//
//  Recipe.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import Foundation

struct RecipeList: TestDataDecodable {
    let drinks: [Recipe]
}

struct Recipe: TestDataDecodable {

    let id: String?
    let name: String?
    let alternateName: String?
    let tags: String?
    let video: String?
    let category: String?
    let iba: String?
    let glass: String?
    let instructions: String?
    let imageThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case alternateName = "strDrinkAlternate"
        case tags = "strTags"
        case video = "strVideo"
        case category = "strCategory"
        case iba = "strIBA"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case imageThumb = "strDrinkThumb"
        
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
    }
}
