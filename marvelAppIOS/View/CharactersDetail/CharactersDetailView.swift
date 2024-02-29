//
//  CharactersDetailView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharactersDetailView: View {
    @StateObject private var viewModel = SeriesViewModdel()
    var idCharacter = ""
    init(idCharacter: String) {
        self.idCharacter = idCharacter
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            List {
                switch viewModel.status {
                case Status.none:
                        Text("Detail None")
                case Status.loading:
                    LoadingView()
                        .frame(width: 600, height: 550)
                case Status.error(error: let errorString):
                    Text("Error: \(errorString)")
                case Status.loaded:
                    //If there is data, unwrap series
                    if let data = viewModel.seriesData?.data.results {
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
            }
            .listStyle(PlainListStyle()) // List Style
            .onAppear {
                //Loading the series
                viewModel.getSeries(id: idCharacter)
            }
          
            }
        
    }
}

#Preview {
    CharactersDetailView(idCharacter: "\(SeriesViewModdel().getFakeId())")
        .environmentObject(RootViewModel(test: true))
}
