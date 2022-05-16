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
            VStack (alignment:.leading){
                Text("All Recipes")
                    .bold()
                    .padding(.top,40)
                    .font(.largeTitle)
                
                ScrollView{
                    //Put it in a container. Improved version of Vstack is lazy version of the stacks
                    LazyVStack(alignment:.leading) { //Only renders elements as needed
                        ForEach(model.recipes) { r in
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
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .navigationBarHidden(true)
                        .padding(.leading)
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
