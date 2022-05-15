//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/14/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        //This code has been put in the data service
        self.recipes = DataService.getLocalData()
        
    }
}
