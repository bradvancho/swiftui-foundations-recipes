//
//  ContentView.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/14/22.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel // This property will not be automatically be populated with what is in the environmentObject modifier
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack(spacing: 20.0) {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                    }
                }


            }.navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
