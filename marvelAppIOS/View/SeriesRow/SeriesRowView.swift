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
    SeriesRowView(series: SeriesViewModdel().getFakeSerie())
}
