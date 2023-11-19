//
//  RootModels.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 19/11/23.
//

import Foundation


import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [CharacterList]
}

// MARK: - Character
struct CharacterListr: Codable, Identifiable {
    let id: Int?
    let name, description: String?
    let modified: String?
    //let thumbnail: Thumbnail?
    let resourceURI: String?
    //let series: Series?
    //let stories: Stories?
    //let events: Series?
    //let urls: [URLElement]?
}

struct CharacterList: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let modified: Date
    let thumbnail: Thumbnail
    let resourceURI: String
    let series: Series
    let stories: Stories
    let events: Series
    let urls: [URLElement]
}

// MARK: - Series
struct Series: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [SeriesItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct SeriesItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct Thumbnails: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extensions: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// Enum para el tipo de extensión
enum Extension: String, Codable {
    case jpg = "jpg"
    case png = "png"
    // Agrega otras extensiones si es necesario
}

// MARK: - URLElement
struct URLElements: Codable {
    let type: URLType
    let url: String
}

enum URLTypes: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}

// Define la estructura URLElement con un enum para el tipo de URL
struct URLElement: Codable, Identifiable {
    let id = UUID() // Necesario para Identifiable
    let type: URLType
    let url: String
}

// Enum para el tipo de URL
enum URLType: String, Codable {
    case detail
    case wiki
    case comiclink
}

typealias Welcome = [WelcomeElement]
