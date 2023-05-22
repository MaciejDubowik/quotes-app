//
//  QuotesService.swift
//  quotes-app
//
//  Created by Maciej Dubowik on 20/05/2023.
//

import Foundation

class QuotesService {
    func loadData(completion:@escaping ([Quote]?) -> Void) {
        guard let category = "happiness".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category="+category) else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.setValue("pupRa6zOjLmEBPQSr/jGew==CswYN7bYpvTayorH", forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data received.")
                completion(nil)
                return
            }

            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                completion(quotes)
            } catch let error {
                print("Failed to decode JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}

