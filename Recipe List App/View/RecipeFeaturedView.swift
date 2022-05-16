//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/15/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel //Preview doesnt get populated
    var body: some View {
        
        VStack(alignment: .leading,spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView { //can also be used as a swipeable cad
                    ForEach (0..<model.recipes.count){ index in
                        if model.recipes[index].featured == true {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)

                                VStack(spacing:0){
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                                
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, hearty...")
            }
            .padding([.leading,.bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())//not populated because data comes from tab view, so have to specify it
    }
}
