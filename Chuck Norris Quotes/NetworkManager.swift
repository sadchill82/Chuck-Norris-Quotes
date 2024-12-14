//
//  NetworkManager.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//

import Foundation

struct QuoteResponse: Codable {
    let id: String
    let value: String
    let categories: [String]
}

class NetworkManager {
    func fetchRandomQuote(completion: @escaping (QuoteResponse?) -> Void) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                let response = try? JSONDecoder().decode(QuoteResponse.self, from: data)
                completion(response)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
