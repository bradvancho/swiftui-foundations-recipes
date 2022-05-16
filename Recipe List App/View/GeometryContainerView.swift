//
//  GeometryContainerView.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/15/22.
//

import SwiftUI

struct GeometryContainerView: View {
    var body: some View {
            
        VStack (spacing: 0){
            GeometryReader { geo in
                Rectangle()
                    .frame(width: geo.size.width/4, alignment: .center)
                    .onTapGesture {
                        print("Global X: \(geo.frame(in:.global).minX), Y: \(geo.frame(in:.global).minY)")
                        print("Local X: \(geo.frame(in:.local).minX), Y: \(geo.frame(in:.local).minY)")
                        
                    }
            }.position(x:300,y:300)
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: geo.size.width/4, alignment: .center)
                    .onTapGesture {
                        print("Global X: \(geo.frame(in:.global).minX), Y: \(geo.frame(in:.global).minY)")
                        print("Local X: \(geo.frame(in:.local).minX), Y: \(geo.frame(in:.local).minY)")
                        
                    }
            }

        }

    }
}

struct GeometryContainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryContainerView()
        }
    }
}
