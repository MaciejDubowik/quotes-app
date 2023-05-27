//
//  FavoritesViewModel.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 15/05/2023.
//

import Foundation

class FavoritesViewModel {
    static let shared = FavoritesViewModel()
    private init() {}

    var favoriteQuotes = FavoriteQuotes(quotes: [])
    
}

