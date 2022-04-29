//
//  Product.swift
//  test
//
//  Created by Admin on 4/28/22.
//

import Foundation

struct SearchResults : Codable {
    let results : [Product]
}

struct Product : Codable {
    let id : Int
    let title : String
    let image : String
}
