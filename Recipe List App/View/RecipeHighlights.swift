//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/15/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    init(highlights:[String]) {
        // Loop through the highlights and build the string
        for index in 0..<highlights.count {
            //If this is the last item, don't add a comma
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var allHighlights = ""
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["Test1","Test2","Test3"])
    }
}
