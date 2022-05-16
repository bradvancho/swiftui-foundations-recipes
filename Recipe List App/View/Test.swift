//
//  Test.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/15/22.
//

import SwiftUI

struct Test: View {
    
    @State var selectedIndex = "1"
    var body: some View {
        
        VStack {
            Picker("Tap Me", selection: $selectedIndex) {
                Text("Option 1").tag("1")
                Text("Option 2").tag("2")
                Text("Option 3").tag("3")
            }
            .pickerStyle(MenuPickerStyle())
            Text("You've selected \(selectedIndex)")
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
