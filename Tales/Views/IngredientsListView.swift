//
//  IngredientsListView.swift
//  Tales
//
//  Created by Antonio Carella on 6/26/20.
//

import SwiftUI

struct IngredientsListView: View {

    private let network = Network()

    @State private var ingredients = [Ingredient]()

    var body: some View {
        NavigationView {
            List(ingredients, id: \.name) { item in
                HStack(alignment: .center) {
                    NavigationLink(destination: DrinkListView(ingredientName: item.name)) {
                        Text(item.name)
                            .font(.body)
                    }
                }
            }
            .navigationTitle("Ingredients")
        }
        .onAppear {
            fetchIngredientsList()
        }
    }

    private func fetchIngredientsList() {
        network.get(request: .ingredientsList) { (result: Result<IngredientList, Error>) in
            switch result {
            case .success(let ingredientList):
                self.ingredients = ingredientList.drinks.sorted(by: { $0.name < $1.name })
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IngredientsListView()
            IngredientsListView()
        }
    }
}
