//
//  CharacterRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharacterRowView: View {
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
            
          
            VStack {
                Spacer() //Pus the box to te bottom
                HStack{
                    
                    //Character name
                    Text("ROUGH")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    Spacer() // Push the text to the leading
                }
                .padding(0.0)
                .frame(maxWidth: .infinity)
                .frame(height: 69)
                .background(.black)
            }
            .frame(height: 70)
            .background(.red)
        })
       
        
    }
}

#Preview {
    CharacterRowView()
}
