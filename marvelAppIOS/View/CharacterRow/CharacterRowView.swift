//
//  CharacterRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharacterRowView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var character: CharacterList // Model
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            //Prueba data
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
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
                .background(.yellow)
                .opacity(0.3)
            
            
            //Character name
            VStack {
                Spacer() //Pus the box to te bottom
                HStack{
                    Text(character.name ?? "Place Holder")
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
        description: "Row dscription",
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
       series: Series(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [], returned: 1)
    ))
}
