//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 5.06.2024.
//

import UIKit

/// Controller to show and search for Locations
final class RMLocationViewController: UIViewController, RMLocationViewViewModelDelegate, RMLocationViewDelegate {
    
    private let primaryView = RMLocationView()
    
    private let viewModel = RMLocationViewViewModel()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primaryView.delegate = self
        view.addSubview(primaryView)
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
        addConstraints()
        viewModel.delegete = self
        viewModel.fetchLocations()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch() {
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            primaryView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
//    MARK: - RMLocationViewDelegate
    
    func rmLocationView(_ locationView: RMLocationView, didSelect location: RMLocation) {
        let vc = RMLocationDetailViewController(location: location)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
//    MARK: - LocationViewModel Delegate
    
    func didFetchInitialLocations() {
        primaryView.configure(viewModel: viewModel)
    }
}
