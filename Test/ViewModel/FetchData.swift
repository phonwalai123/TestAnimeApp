//
//  FetchData.swift
//  Test
//
//  Created by phonwalai on 21/6/2564 BE.
//

import SwiftUI

class FetchData: ObservableObject {
    
    @Published var itemData : [Card] = []
    
    init() {
        
        fetch()
    }
    
    func fetch() {
        
        let url = "https://api.jikan.moe/v3/user/Nekomata1037/animelist/all"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!){(data, _, _) in
            
            guard let JSONData = data else{return}
            
            do{
                let item = try JSONDecoder().decode(Item.self, from: JSONData)
                print(item)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}


