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

struct CharactersListView: View {
    var characters: [Character] // Model
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
                        .navigationBarItems(trailing: EmptyView())
                    }
                    .listStyle(PlainListStyle())
                }
            }  
        }
        .background(.red)
        
    }
}


#Preview {
    CharactersListView(characters: charactersArray )
}
