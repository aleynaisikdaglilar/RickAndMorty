//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 4.10.2024.
//

import UIKit

/// Configurable controller to search
final class RMSearchViewController: UIViewController {
    
    struct Config {
        enum `Type`{
            case character
            case episode
            case location
        }
        
        let type: `Type`
    }
    
    private let config: Config
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
    }
    
}
