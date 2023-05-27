//
//  QuotesViewModel.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 15/05/2023.
//

import Foundation
import UIKit


class QuotesViewModel: NSObject {
    private let favoritesViewModel = FavoritesViewModel.shared
    private var quotesService = QuotesService()
    private var quotes: [Quote] = []
        
    func loadNextQuoteButtonPressed() {
        quotesService.loadData { quotes in
            guard let quotes = quotes else {
                print("Failed to load quotes.")
                return
            }
            
            self.quotes = quotes
            print(quotes)

        }
        
    }

    func getQuoteText() -> String {
        return quotes.first?.quote ?? "something gone wrong, try again"
    }
    
    func getQuoteAuthor() -> String {
        return quotes.first?.author ?? ""
    }
    
    func addToFavorites() {
        favoritesViewModel.favoriteQuotes.quotes.append(quotes.first!)
        print(favoritesViewModel.favoriteQuotes.quotes)
    }
    
}
