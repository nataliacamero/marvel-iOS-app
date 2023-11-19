//
//  CharactersListView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

let charactersArray = [Character(
    id: 1,
    name: "Rough",
    description: "The second most power mutant girl",
    photo: "https://prueba/rough"
), Character(
    id: 2,
    name: "Rough",
    description: "The second most power mutant girl",
    photo: "https://prueba/rough"
), Character(
    id: 3,
    name: "Rough",
    description: "The second most power mutant girl",
    photo: "https://prueba/rough"
), Character(
    id: 4,
    name: "Rough",
    description: "The second most power mutant girl",
    photo: "https://prueba/rough"
), Character(
    id: 5,
    name: "Rough",
    description: "The second most power mutant girl",
    photo: "https://prueba/rough"
)]
let character = CharacterList(
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
)
let previewCharactersArray = [CharacterList]()


struct CharactersListView: View {
    //var characters: [Character] // Model
    @EnvironmentObject var rootViewModel: RootViewModel
    var characters: [CharacterList]
    var body: some View {
        VStack {
            Spacer()
            Text("MARVEL")
                .font(.system(size: 50))
                .bold()
                .foregroundStyle(.white)
                .opacity(0.9)
            //Characters list
            NavigationStack {
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)
                    List {
                        ForEach(characters) { data in
                            NavigationLink {
                                //Destino
                                CharactersDetailView(characters: charactersArray)
                                    
                            } label: {
                                Spacer()
                                //La celda personalizada
                                CharacterRowView(character: data)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 320)
                            }
                        }
                        .listRowBackground(Color.white)
                    }
                    .listStyle(PlainListStyle())
                }
            }  
        }
        .background(.red)
        
    }
}


#Preview {
    CharactersListView(characters: previewCharactersArray)
        .environmentObject(RootViewModel())
}
