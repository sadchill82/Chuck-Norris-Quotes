//
//  MainTabBarController.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomQuoteVC = RandomQuoteViewController()
        randomQuoteVC.tabBarItem = UITabBarItem(title: "Случайная", image: UIImage(systemName: "star"), tag: 0)
        
        let allQuotesVC = AllQuotesViewController()
        allQuotesVC.tabBarItem = UITabBarItem(title: "Все цитаты", image: UIImage(systemName: "list.bullet"), tag: 1)
        
        let categoriesVC = CategoriesViewController()
        categoriesVC.tabBarItem = UITabBarItem(title: "Категории", image: UIImage(systemName: "folder"), tag: 2)
        
        viewControllers = [randomQuoteVC, allQuotesVC, categoriesVC]
    }
    
}
