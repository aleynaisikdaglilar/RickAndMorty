//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 10.07.2024.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
