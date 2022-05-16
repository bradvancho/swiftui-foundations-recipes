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
    
    static func getPortion(ingredient: Ingredients, recipeServings: Int, targetServings: Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1 // nil coalescing operator, gives 1 if its nil
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        // Get a single serving size by multiplying denominator by the recipe serving
        if ingredient.num != nil  {
            denominator *= recipeServings
        
        //Get target portion by multiplying numerator by target serving
            numerator += targetServings
        //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
        //Get the whole portion of numerator > denominator
            if numerator >= denominator {
                //calculate whole portions
                wholePortions = numerator/denominator
                //calculate the remainder
                numerator = numerator % denominator
                //assign to portion string
                portion += String(wholePortions)
            }
        //Express the remainder as a fraction
            if numerator > 0 {
                //assign the remainder as a fraction to the portion string
                portion += wholePortions > 0 ? " " : "" // if whole portions > 0 then add space other dont 
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit { //BC this is optional
            if wholePortions > 0 {
                //Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }

            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        return String(portion)
    }
}
