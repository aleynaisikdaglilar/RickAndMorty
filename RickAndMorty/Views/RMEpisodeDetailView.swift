//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 3.10.2024.
//

import UIKit

final class RMEpisodeDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .systemRed
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
