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
    description: "Hola soy una descripción",
    thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
    resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
    //series: Series(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/series", items: [], returned: 1)
)
let previewCharactersArray = [CharacterList]()


struct CharactersListView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
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
                        if let data = rootViewModel.dataCharacters?.data.results {
                            ForEach(data) { data in
                                NavigationLink {
                                    //Destino
                                    //TODO: Enviar id de personaje
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
                       
                    }
                    .listStyle(PlainListStyle())
                }
            }  
        }
        .background(.red)
        
    }
}


#Preview {
    CharactersListView()
        .environmentObject(RootViewModel())
}
