//
//  SeriesRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct SeriesRowView: View {
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
                .background(.indigo)
                .opacity(0.5)

            VStack {
                Spacer()
                //Description
                Text(character.description)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .opacity(1)
                Spacer() // Push the text to the center
            
            }
            
            //Character name
            HStack{
                Text(character.name.uppercased())
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                    .opacity(1)
                Spacer() // Push the text to the leading
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(.red)
            
           
            
        })
        .padding(10)
        .background(.white)
        .opacity(0.95)
        
        
    }
}

#Preview {
    SeriesRowView(character: Character(
        id: 1,
        name: "Rough",
        description: "The second most power mutant girl",
        photo: "https://prueba/rough"
    ))
}
