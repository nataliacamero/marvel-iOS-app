//
//  SeriesRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct SeriesRowView: View {
    var character: SeriesItem// Model
    var title = ""
    var idItem = UUID()
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
          
//            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
//                //foto descargada
//                photo
//                    .resizable()
//                    .opacity(1)
//                
//            } placeholder: {
//                Image(systemName: "photo")
//                    .resizable()
//                    .opacity(1)
//            }
            
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
                Text(title)
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
                Text(character.name ?? "Default")
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
//    SeriesRowView(character: SeriesItem(
//        id: 1011334,
//        resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334.jpg",
//        name: "3-D Man"
//    ))
    
    SeriesRowView(character: SeriesItem(
        id: UUID(),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334.jpg",
        name: "3-D Man"
    ), title: "Test title", idItem: UUID())
}
