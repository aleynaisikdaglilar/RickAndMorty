//
//  RMSearchInputView.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 17.10.2024.
//

import UIKit

final class RMSearchInputView: UIView {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private var viewModel: RMSearchInputViewViewModel? {
        didSet {
            guard let viewModel = viewModel, viewModel.hasDynamicOptions else {
                return
            }
            let options = viewModel.options
            createOptionSelectionViews(options: options)
        }
    }
    
    //    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPink
        addSubviews(searchBar)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
    private func  createOptionSelectionViews(options: [RMSearchInputViewViewModel.DynamicOption]) {
        for option in options {
            print(option.rawValue)
        }
    }
    
    public func configure(with viewModel: RMSearchInputViewViewModel) {
        searchBar.placeholder = viewModel.searchPlaceholderText
//        TODO: Fiz height of input view for episode with no options 
        self.viewModel = viewModel
    }
}
