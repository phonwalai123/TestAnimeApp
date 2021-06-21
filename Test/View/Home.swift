//
//  Home.swift
//  Test
//
//  Created by phonwalai on 21/6/2564 BE.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = FetchData()
    var body: some View {
        
        ScrollView{
            
            //fetched data
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
