//
//  RMLocationView.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 13.10.2024.
//

import UIKit

protocol RMLocationViewDelegate: AnyObject {
    func rmLocationView(_ locationView: RMLocationView, didSelect location: RMLocation)
}

final class RMLocationView: UIView {
    public weak var delegate: RMLocationViewDelegate?
    
    private var viewModel: RMLocationViewViewModel? {
        didSet {
            spinner.stopAnimating()
            tableView.isHidden = false
            tableView.reloadData()
            UIView.animate(withDuration: 0.3) {
                self.tableView.alpha = 1
            }
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(RMLocationTableViewCell.self, forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier)
        table.alpha = 0
        table.isHidden = true
        return table
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    //    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(tableView, spinner)
        spinner.startAnimating()
        addConstraints()
        configureTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func configure(viewModel: RMLocationViewViewModel) {
        self.viewModel = viewModel
    }
}

extension RMLocationView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(" print(indexPath)")
        print(indexPath)
        
        guard let locationModel = viewModel?.location(at: indexPath.row) else {
            return
        }
        print("print(locationModel)")
        print(locationModel)
        delegate?.rmLocationView(self, didSelect: locationModel)
    }
}

extension RMLocationView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModels = viewModel?.cellViewModels else {
            fatalError()
        }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RMLocationTableViewCell.cellIdentifier,
            for: indexPath
        ) as? RMLocationTableViewCell else {
            fatalError()
        }
        let cellViewModel = cellViewModels[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
}
