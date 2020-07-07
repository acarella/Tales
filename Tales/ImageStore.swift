//
//  ImageStore.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import SwiftUI

class ImageLoader: ObservableObject {

    @Published public private(set) var image: Image? = nil

    private let placeholderNames = [
        "americano",
        "citrus",
        "fruit-cocktail",
        "gin",
        "margarita",
        "mojito",
        "old-fashioned-2",
        "old-fashioned",
        "sangria",
        "spritz-1",
        "spritz"
    ]

    func loadRandomPlaceholder() {
        let imageName = placeholderNames[Int.random(in: 0...placeholderNames.count - 1)]
        image = Image(imageName)
    }
}
