//
//  DrinkList.swift
//  Tales
//
//  Created by Antonio Carella on 6/26/20.
//

import SwiftUI

struct DrinkListView: View {

    private let network = Network()

    var ingredientName: String!

    @State private var drinks = [Drink]()

    var body: some View {
        VStack {
            List(drinks, id: \.id) { item in
                NavigationLink(destination: RecipeView(id: item.id)) {
                    DrinkRow(drink: item)
                }
            }
        }
        .navigationTitle("Drinks with \(ingredientName)")
        .onAppear {
            fetchDrinkList()
        }
    }

    private func fetchDrinkList() {
        network.get(request: .drinkList(ingredientName)) { (result: Result<DrinkList, Error>) in
            switch result {
            case .success(let drinkList):
                self.drinks = drinkList.drinks
            case .failure(let error):
                print(error)
            //                    Alert(title: Text("Uh-oh"), message: Text("Something went wrong. \(error) might have something to do with it. Please try again."), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

struct DrinkList_Previews: PreviewProvider {
    static var previews: some View {
        DrinkListView()
    }
}
