//
//  CategoriesViewController.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//


import UIKit
import RealmSwift

class CategoriesViewController: UITableViewController {
    private let realm = try! Realm()
    private var categories: Results<Category>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Категории"
        categories = realm.objects(Category.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let quotesVC = QuotesByCategoryViewController(category: category.name)
        navigationController?.pushViewController(quotesVC, animated: true)
    }
}
