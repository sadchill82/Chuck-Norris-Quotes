//
//  QuotesByCategoryViewController.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//


import UIKit
import RealmSwift

class QuotesByCategoryViewController: UITableViewController {
    private let category: String
    private let realm = try! Realm()
    private var quotes: Results<Quote>!
    
    init(category: String) {
        self.category = category
        super.init(style: .plain)
        self.quotes = realm.objects(Quote.self).filter("category == %@", category)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Цитаты: \(category)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let quote = quotes[indexPath.row]
        cell.textLabel?.text = quote.text
        return cell
    }
}
