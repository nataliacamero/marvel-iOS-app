//
//  CharactersDetailView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharactersDetailView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    //var characters: [SeriesItem] // Model
    var idCharacter = ""
    init(idCharacter: String) {
        self.idCharacter = idCharacter
    }
    var body: some View {
//        ZStack {
//            Color.white.edgesIgnoringSafeArea(.all)
//            List {
//                ForEach(characters) { data in
//                    //La celda personalizada
//                    SeriesRowView(character: data, idItem: UUID())
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 600)
//                }
//                .listRowBackground(Color.white)
//                .navigationBarItems(trailing: EmptyView())
//            }
//            .listStyle(PlainListStyle()) // Establece el estilo de la lista (puedes elegir el estilo que prefieras)s
//        }
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            List {
                if let data = rootViewModel.seriesData?.data.results {
                    ForEach(data) { data in
                        //La celda personalizada
                        SeriesRowView(series: data)
                            .frame(maxWidth: .infinity)
                            .frame(height: 600)
                    }
                    .listRowBackground(Color.white)
                    .navigationBarItems(trailing: EmptyView())
                }
                
            }
            .listStyle(PlainListStyle()) // Establece el estilo de la lista (puedes elegir el estilo que prefieras)s
            .onAppear {
                rootViewModel.getSeries(id: idCharacter)
            }
        }
    }
}

#Preview {
    CharactersDetailView(idCharacter: "1011495")
        .environmentObject(RootViewModel())
}
