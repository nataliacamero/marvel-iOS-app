//
//  MockData.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 19/2/24.
//

import Foundation

let charactersArray: [CharacterList] = [CharacterList(
    id: 1011334,
    name: "3-D Man",
    title: "2Prueba d titulo",
    description: "Hola soy una descripción",
    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
),CharacterList(
    id: 1011335,
    name: "3-D Man",
    title: "3Prueba d titulo",
    description: "Hola soy una descripción",
    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
),CharacterList(
    id: 1011336,
    name: "3-D Man",
    title: "4Prueba d titulo",
    description: "Hola soy una descripción",
    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
),CharacterList(
    id: 1011337,
    name: "3-D Man",
    title: "5Prueba d titulo",
    description: "Hola soy una descripción",
    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
)]

let seriesArray: [SeriesItem] = [SeriesItem(
    id: UUID(),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334.jpg",
    name: "3-D Man"
), SeriesItem(
    id: UUID(),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334.jpg",
    name: "3-D Man"
),SeriesItem(
    id: UUID(),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334.jpg",
    name: "3-D Man"
),SeriesItem(
    id: UUID(),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334.jpg",
    name: "3-D Man"
),SeriesItem(
    id: UUID(),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334.jpg",
    name: "3-D Man"
)]
let character = CharacterList(
    id: 1011334,
    name: "3-D Man",
    title: "6Prueba d titulo",
    description: "Hola soy una descripción",
    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
)
let previewCharactersArray = [CharacterList]()
