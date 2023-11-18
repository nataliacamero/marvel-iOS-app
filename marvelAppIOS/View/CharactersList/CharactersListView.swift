//
//  CharactersListView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharactersListView: View {
    var body: some View {
        NavigationStack {
            List{
                NavigationLink {
                    //Destino
                    
                } label: {
                    //La celda personalizada
                    CharacterRowView()
                        .frame(height: 300)
                    
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                
                
              
              
                
            }
            .navigationTitle("CHARACTERS")

            
           
        }
        
       
    }
    
    
}


#Preview {
    CharactersListView()
}
