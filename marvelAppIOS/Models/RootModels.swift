//
//  RootModels.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 19/11/23.
//

import Foundation


// MARK: - ModelMarvel -
struct ModelMarvel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharactersData
}

// MARK: - CharactersData -
struct CharactersData: Codable {
    let offset, limit, total, count: Int
    let results: [CharacterList]
}

// MARK: - CharacterList -
struct CharacterList: Codable, Identifiable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Thumbnail
    let resourceURI: String?
    let series: Series
}

// MARK: - Series -
struct Series: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [SeriesItem]?
    let returned: Int?
}

//// MARK: - ComicsItem -
//struct SeriesItem: Codable {
//    let resourceURI: String?
//    let name: String?
//}

// MARK: - ComicsItem -
struct SeriesItem: Codable, Identifiable {
    let id: UUID?
    let resourceURI: String?
    let name: String?
}

//MARK: - SeriesItemId -
struct SeriesItemId {
    
}


// MARK: - Thumbnail -
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - Enum para el tipo de extensión -
enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}
