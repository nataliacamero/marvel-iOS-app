//
//  CharacterRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

// MARK: - Result
struct Character: Identifiable {
    let id: Int
    let name, description: String
    let photo: String
}


struct CharacterRowView: View {
    var character: Character // Model
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            //Character image
            Image(.rouge)
                .resizable()
                .opacity(1)
            
            //Darken image
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.3)
            
            
            //Character name
            VStack {
                Spacer() //Pus the box to te bottom
                HStack{
                    Text(character.name.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .opacity(0.9)
                    Spacer() // Push the text to the leading
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.black)
            }
            .frame(height: 80)
            .background(.red)
        })
        .padding(10)
        .background(.white)
        .opacity(0.95)
        
        
    }
}

#Preview {
    CharacterRowView(character: Character(
        id: 1, 
        name: "Rough",
        description: "The second most power mutant girl",
        photo: "https://prueba/rough"
    ))
}
