//
//  SeriesRowView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import SwiftUI

struct SeriesRowView: View {
    var series: CharacterList// Model
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            //Image and title
            AsyncImage(url: URL(string: "\(series.thumbnail.path).\(series.thumbnail.thumbnailExtension)")) { photo in
                //Downloaded photo
                photo
                    .resizable()
                    .opacity(1)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .opacity(1)
            }
        
            //White layer
            Image(decorative: "")
                .resizable()
                .background(.white)
                .opacity(0.6)

            VStack {
                Spacer()
                //Description
                if let description = series.description {
                    Text("\(description)")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer() // Push the text to the center
                } else {
                    Text("No description available about this serie")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer() // Push the text to the center
             
                }
            }
            
            //Series title
            HStack{
                if let title = series.title {
                    Text("\(title.capitalized)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .opacity(1)
                    Spacer() // Push the text to the leading
                }
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
    SeriesRowView(series: CharacterList(
        id: 1011334,
        name: "3-D Man",
        title: "6 Prueba d titulo",
        description: "Spider-Man's secret identity is Peter Benjamin Parker. Initially, Peter was depicted as a teenage high-school student and an orphan raised by his Aunt May and Uncle Ben in New York City after his parents Richard and Mary Parker died in a plane crash.",
        thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
    ))
}
