//
//  CharacterRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct CharacterRowView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var character: CharacterList // Model
    
    // Initializer
    init(character: CharacterList) {
        self.character = character
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            //Data test
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                //Download photo
                photo
                    .resizable()
                    .opacity(1)
                	
            } placeholder: {
                //Image by default
                Image(systemName: "photo")
                    .resizable()
                    .opacity(1)
            }
            
            //Darken image
            Image(decorative: "")
                .resizable()
                .opacity(0.3)
            
            
            //Character name
            VStack {
                Spacer() //Pus the box to te bottom
                HStack{
                    if let name = character.name {
                    Text("\(name)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                            .opacity(0.9)
                    }
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
    CharacterRowView(character: RootViewModel(test: true).getFakeCharacter())
}
