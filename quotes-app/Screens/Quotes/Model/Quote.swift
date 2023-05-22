//
//  Quote.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 15/05/2023.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "quote"
        case author = "author"
        case category = "category"
    }
}



