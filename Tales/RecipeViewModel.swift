//
//  RecipeViewModel.swift
//  Tales
//
//  Created by Antonio Carella on 6/27/20.
//

import Foundation
import Combine

protocol RecipeViewModelProtocol: ObservableObject {
    var name: String { get }
    var recipeInstructions: String { get }
    var ingredientList: [String] { get }
    var id: String! { get }
    func getRecipe()
}

class RecipeViewModel: RecipeViewModelProtocol {

    let network = Network()
    var id: String!

    @Published var name: String = ""
    @Published var recipeInstructions: String = ""
    @Published var ingredientList: [String] = []

    var cancellationToken: AnyCancellable?
}

extension RecipeViewModel {

    func getRecipe() {
        cancellationToken = network.run(Get.recipe(id).request())
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { (response: Network.Response<RecipeList>) in
                print("Reponse: \(response.value)")
                let dict = response.value
                let recipe = dict.drinks.first!
                self.setProperties(from: recipe)
            })
    }

    private func setProperties(from recipe: Recipe) {
        self.name = recipe.name ?? ""
        self.recipeInstructions = recipe.instructions ?? "Instructions Unavailable"
        self.ingredientList = ingredientList(from: recipe)
    }

    private func ingredientList(from recipe: Recipe) -> [String] {
        // get the non-nil value of any ingredient
        let ingredients = Mirror(reflecting: recipe).children.reduce(into: [String]()) {
            if let val = $1.value as? String, $1.label?.contains("strIngredient") ?? false {
                $0.append(val)
            }
        }

        // get the non-nil value of any measurement
        let measurements = Mirror(reflecting: recipe).children.reduce(into: [String]()) {
            if let val = $1.value as? String, $1.label?.contains("strMeasure") ?? false {
                $0.append(val)
            }
        }

        return zip(measurements, ingredients).compactMap {
            return "\($0.0) \($0.1)"
        }
    }
}

