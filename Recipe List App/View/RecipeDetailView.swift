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
    @State var selectedServing = 2
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top,20)
                    .padding(.leading,10)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading){
                    Text("Select Your Serving Size")
                    Picker("Not Used",selection:$selectedServing) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width:160)
                }
                .padding()

                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding([.bottom,.leading], 5)
                    ForEach (recipe.ingredients){ item in //dont need ID because this is an identifiable object
                        Text("-" + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServing) + " " + item.name.lowercased())
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
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it to detail view so we can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[1])
    }
}
