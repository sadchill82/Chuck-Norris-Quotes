//
//  AllQuotesViewController.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//


import UIKit
import RealmSwift

class AllQuotesViewController: UITableViewController {
    private let realm = try! Realm()
    private var quotes: Results<Quote>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Все цитаты"
        quotes = realm.objects(Quote.self).sorted(byKeyPath: "date", ascending: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let quote = quotes[indexPath.row]
        cell.textLabel?.text = quote.text
        cell.detailTextLabel?.text = quote.category
        return cell
    }
}
