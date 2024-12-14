//
//  Models.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//

import Foundation
import RealmSwift

class Quote: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var text: String
    @Persisted var category: String
    @Persisted var date: Date
}

class Category: Object {
    @Persisted(primaryKey: true) var name: String
}
