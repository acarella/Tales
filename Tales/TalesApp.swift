//
//  TalesApp.swift
//  Tales
//
//  Created by Antonio Carella on 6/26/20.
//

import SwiftUI

@main
struct TalesApp: App {
    var body: some Scene {
        WindowGroup {
            IngredientsListView()
        }
    }
}

struct TalesApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
