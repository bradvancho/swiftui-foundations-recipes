//
//  DataService.swift
//  Recipe List App
//
//  Created by Brad vancho on 5/14/22.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] { //static method means we can ues this without creating an instance of this
        //Get URL path
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if path is not nill, otherwise...
        guard path != nil else {
            return [Recipe]()
        }
        //Create URL object
        let url = URL(fileURLWithPath: path!)
        
        //Create data object
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {//Decode the data
                let recipes = try decoder.decode([Recipe].self, from: data)
                
                //Add unique ID's
                for r in recipes {
                    r.id = UUID()
                }
                return recipes // return the rceipes
            }
            catch {
                print(error)
            }
            
        }
        catch {
            print(error)
        }
        return [Recipe]() //return empty array if it every gets here
    }
}
