//
//  CharactersDetailView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharactersDetailView: View {
    @StateObject private var seriesViewModel = SeriesViewModdel()
    var idCharacter = ""
    init(idCharacter: String) {
        self.idCharacter = idCharacter
    }
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            List {
                //If there is data, unwrap series
                if let data = seriesViewModel.seriesData?.data.results {
                    ForEach(data) { data in
                        //The custome cell
                        SeriesRowView(series: data)
                            .frame(maxWidth: .infinity)
                            .frame(height: 600)
                    }
                    .listRowBackground(Color.white)
                    .navigationBarItems(trailing: EmptyView())
                } else {
                    Text("Loading...")
                }
            }
            .listStyle(PlainListStyle()) // List Style
            .onAppear {
                //Loading the series
                seriesViewModel.getSeries(id: idCharacter)
            }
        }
    }
}

#Preview {
    CharactersDetailView(idCharacter: "\(SeriesViewModdel().getFakeId())")
        .environmentObject(RootViewModel(test: true))
}
