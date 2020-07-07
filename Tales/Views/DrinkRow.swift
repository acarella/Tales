//
//  DrinkRow.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import SwiftUI

struct DrinkRow: View {

    @StateObject var imageLoader = ImageLoader()
    @State var drink: Drink

    var body: some View {
        HStack {
            imageLoader.image?
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(drink.name)
            .font(.headline)
        }
        .onAppear() {
            imageLoader.loadRandomPlaceholder()
        }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(drink: Drink.testData)
    }
}
