//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 9.06.2024.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    /// Endpoint to get character info
    case character // "character"
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
