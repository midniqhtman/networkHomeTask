//
//  ViewController.swift
//  networkHomeTask
//
//  Created by Байсаев Зубайр on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var categories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLoad()
            }
            
            func categoryLoad() {
            let urlString = "https://fakestoreapi.com/products/categories"
            
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
        
                if let error = error { print(error) }
        
                guard let data = data else { return }
                do { let categories = try JSONDecoder().decode([String].self, from: data)
                    DispatchQueue.main.async {
                    self.categories = categories
                    print(categories)
                    }
                } catch { print(error) }
            }.resume()
    }
}

