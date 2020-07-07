//
//  RecipeView.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import SwiftUI

struct RecipeView: View {

    init(id: String) {
        viewModel.id = id
        viewModel.getRecipe()
    }

    private let network = Network()

    @StateObject var imageLoader = ImageLoader()
    @ObservedObject private var viewModel = RecipeViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 8.0) {
                imageLoader.image?
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .cornerRadius(8.0, antialiased: true)
                Spacer()
                Text("Ingredients").font(.title)
                ForEach(viewModel.ingredientList, id: \.self ) {
                    Text($0).multilineTextAlignment(.leading)
                }
                Spacer()
                Text("Instructions").font(.title)
                Text(viewModel.recipeInstructions).multilineTextAlignment(.leading)
                Spacer()
            }.padding()
        }
        .onAppear() { imageLoader.loadRandomPlaceholder() }
        .navigationTitle(viewModel.name)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(id: "11382")
    }
}
