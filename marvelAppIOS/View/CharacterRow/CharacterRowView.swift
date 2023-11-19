//
//  CharacterRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

// MARK: - Result
struct Character: Identifiable {
    let id: Int
    let name, description: String
    let photo: String
}


struct CharacterRowView: View {
    var character: CharacterList // Model
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            //Character image
            //            Image(Thumbnail(path: character.thumbnail.path, thumbnailExtension: .jpg))
            //                .resizable()
            //                .opacity(1)
            
            //Prueba data
            AsyncImage(url: URL(string: "\(character.thumbnail.path)\(character.thumbnail.thumbnailExtension)")) { photo in
                //foto descargada
                photo
                    .resizable()
                    .opacity(1)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .opacity(1)
            }
            
            //Darken image
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.3)
            
            
            //Character name
            VStack {
                Spacer() //Pus the box to te bottom
                HStack{
                    Text(character.name.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .opacity(0.9)
                    Spacer() // Push the text to the leading
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.black)
            }
            .frame(height: 80)
            .background(.red)
        })
        .padding(10)
        .background(.white)
        .opacity(0.95)
        
        
    }
}

#Preview {
    CharacterRowView(character: CharacterList(
        id: 1011334,
        name: "3-D Man",
        description: "",
        modified: Date(),
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
        series: Series(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [], returned: 1),
        stories: Stories(available: 21, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/stories", items: [], returned: 2),
        events: Series(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/events", items: [], returned: 3),
        urls: [
            URLElement(type: .detail, url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=f2ec88156a31feacb4c85986d1ef8ae5"),
            URLElement(type: .wiki, url: "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=f2ec88156a31feacb4c85986d1ef8ae5"),
            URLElement(type: .comiclink, url: "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=f2ec88156a31feacb4c85986d1ef8ae5")
        ]
    ))
}
