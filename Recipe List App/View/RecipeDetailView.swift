//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/14/22.
//

import SwiftUI

/// Add detail for a recipe based on what user taps on in the list view
struct RecipeDetailView: View {
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Incredients
                VStack(alignment: .leading) {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding([.bottom,.leading], 5)
                    ForEach (recipe.ingredients, id:\.self){ item in
                        Text("-" + item)
                    }
                }.padding(.horizontal)
                
                // MARK: Divider
                Divider()
                    
                // MARK: Directions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom,.top],5)
                    ForEach(0..<recipe.directions.count, id:\.self){ index in
                        Text(String(index+1)+". "+recipe.directions[index]).padding(.bottom,5)
                    }
                }
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it to detail view so we can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
