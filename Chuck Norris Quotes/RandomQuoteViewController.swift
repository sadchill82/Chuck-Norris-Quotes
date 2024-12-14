//
//  RandomQuoteViewController.swift
//  Chuck Norris Quotes
//
//  Created by Ислам on 14.12.2024.
//

import UIKit

class RandomQuoteViewController: UIViewController {
    
    private let quoteLabel = UILabel()
    private let loadButton = UIButton(type: .system)
    private let networkManager = NetworkManager()
    private let quoteManager = QuoteManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        quoteLabel.numberOfLines = 0
        quoteLabel.textAlignment = .center
        quoteLabel.text = "Нажмите кнопку, чтобы загрузить цитату"
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loadButton.setTitle( "Загрузить цитату", for: .normal )
        loadButton.addTarget(self, action: #selector(loadQuote), for: .touchUpInside)
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(quoteLabel)
        view.addSubview(loadButton)
        
        NSLayoutConstraint.activate([
            quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loadButton.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 20),
            loadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func loadQuote() {
        networkManager.fetchRandomQuote { response in
            if let response = response {
                self.quoteManager.saveQuoteToRealm(response)
                DispatchQueue.main.async {
                    self.quoteLabel.text = response.value
                }
            }
        }
    }
    
}
