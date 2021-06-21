//
//  Item.swift
//  Test
//
//  Created by phonwalai on 21/6/2564 BE.
//

import SwiftUI

//for fetching data
struct Item: Decodable {
    
    var anime : [String: Double]
    var mal_id : Int
    var title : String
    var image_url :String

}

