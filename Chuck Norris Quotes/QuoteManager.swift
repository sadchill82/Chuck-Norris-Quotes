//
//  QuoteManager.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//

import Foundation
import RealmSwift

class QuoteManager {
    func saveQuoteToRealm(_ response: QuoteResponse) {
        let realm = try! Realm()
        try! realm.write {
            if realm.object(ofType: Quote.self, forPrimaryKey: response.id) == nil {
                let quote = Quote()
                quote.id = response.id
                quote.text = response.value
                quote.category = response.categories.first ?? "Без категории"
                quote.date = Date()
                realm.add(quote)
            }
            
            if let categoryName = response.categories.first {
                if realm.object(ofType: Category.self, forPrimaryKey: categoryName) == nil {
                    let category = Category()
                    category.name = categoryName
                    realm.add(category)
                }
            }
        }
    }
}
