//
//  SeriesViewModdel.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 20/2/24.
//

import SwiftUI
import Combine

final class SeriesViewModdel: ObservableObject {
    @Published var seriesData: ModelMarvel? //Request data series
    @Published var status = Status.none // UI state
    
    var suscriptors = Set<AnyCancellable>()
    
    //Get data Series from API
    func getSeries(id: String) {
        
        //We change to loaded status
        self.status = Status.loading
        
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getSessionCharacterSeries(id: id))
            .tryMap {
                //We evaluate de response, if it is 200, or not.
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    self.status = Status.error(error: "Error de servidor")
                    //Error
                    throw URLError(.badServerResponse)
                }
                
                //if everything is ok
                return $0.data
            }
            .decode(type: ModelMarvel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let errorString):
                    self.status = Status.error(error: errorString.localizedDescription)
                    print("Error serching for series: \(errorString)")
                case .finished:
                    self.status = Status.loaded
                    print("SeriesModelStatus", self.status)
                    print("Response for series recived successfully....")
                }
            } receiveValue: { data in
                print("series Data: -->, \(data) ")
                self.seriesData =  data
            }
            .store(in: &suscriptors)
    }
    
    // ---- Testing and Design ----
    
    func getFakeId() -> CharacterList.ID {
        let fakeId = 1009351
        return fakeId
    }
    
    func getFakeSerie() -> CharacterList {
  
        return CharacterList(
            id: 1009351,
            name: "3-D Man",
            title: "6 Prueba d titulo",
            description: "Spider-Man's secret identity is Peter Benjamin Parker. Initially, Peter was depicted as a teenage high-school student and an orphan raised by his Aunt May and Uncle Ben in New York City after his parents Richard and Mary Parker died in a plane crash.",
            thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: .jpg),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"
        )
    }
}
