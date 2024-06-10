//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 5.06.2024.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
