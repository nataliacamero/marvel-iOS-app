//
//  CharactersDetailView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharactersDetailView: View {
    var characters: [Character] // Model
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            List {
                ForEach(characters) { data in
                    //La celda personalizada
                    SeriesRowView(character: data)
                        .frame(maxWidth: .infinity)
                        .frame(height: 600)
                }
                .listRowBackground(Color.white)
                .navigationBarItems(trailing: EmptyView())
            }
            .listStyle(PlainListStyle()) // Establece el estilo de la lista (puedes elegir el estilo que prefieras)s
        }
    }
}

#Preview {
    CharactersDetailView(characters: charactersArray)
}
