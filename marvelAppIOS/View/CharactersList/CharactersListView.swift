//
//  CharactersListView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharactersListView: View {
    //Enviroment variable that is injected into the delegate
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
                                    //Destiny
                                    CharactersDetailView(idCharacter: String(data.id))
                                        .navigationTitle(data.name ?? "Hero Name")
                                } label: {
                                    Spacer()
                                    //The custome cell
                                    CharacterRowView(character: data)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 320)
                                }
                            }
                            .listRowBackground(Color.white)
                        } else {
                            Text("Loading...")
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
        .environmentObject(RootViewModel(test: true))
}
