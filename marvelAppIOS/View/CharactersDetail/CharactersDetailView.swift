//
//  CharactersDetailView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharactersDetailView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var idCharacter = ""
    init(idCharacter: String) {
        self.idCharacter = idCharacter
    }
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            List {
                //If there is data, unwrap series
                if let data = rootViewModel.seriesData?.data.results {
                    ForEach(data) { data in
                        //The custome cell
                        SeriesRowView(series: data)
                            .frame(maxWidth: .infinity)
                            .frame(height: 600)
                    }
                    .listRowBackground(Color.white)
                    .navigationBarItems(trailing: EmptyView())
                }
                	
            }
            .listStyle(PlainListStyle()) // List Style
            .onAppear {
                //Loading the series
                rootViewModel.getSeries(id: idCharacter)
            }
        }
    }
}

#Preview {
    CharactersDetailView(idCharacter: "1011495")
        .environmentObject(RootViewModel())
}
