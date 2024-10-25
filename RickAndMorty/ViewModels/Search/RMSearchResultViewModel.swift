//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 24.10.2024.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
