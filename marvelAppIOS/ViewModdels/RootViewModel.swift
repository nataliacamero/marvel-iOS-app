//
//  RootViewModel.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 19/11/23.
//

import SwiftUI
import Combine

enum Status {
    case none, loading, loaded, error(error:String)
}

final class RootViewModel: ObservableObject {
    @Published var dataCharacters: ModelMarvel? //Request data character
    @Published var seriesData: ModelMarvel? //Request data series
    @Published var status = Status.none // UI state
    
    var suscriptors = Set<AnyCancellable>()
    
    init() {
        getCharacters()
    }
   
    //Get charachers from API
    //func getCharacters(id: String) {
    func getCharacters() {
        //TODO: variable con ternario que decide a que servicio llamar
//        var chooseSession = id ? BaseNetwork().getSessionCharacterSeries(id: id) : BaseNetwork().getSessionCharactersList()
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionCharactersList())
            .tryMap {
                //We evaluate the response, if it is 200 we return the JSON, if not we return exception
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    //TODO: State here
                    //Error
                    throw URLError(.badServerResponse)
                }	
                
                //Everything is ok
                return $0.data
            }
            .decode(type: ModelMarvel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // We receive it in the main trade
            .sink { completion in
                switch completion {
                case .failure(let errorString):
                    //TODO: status here
                    print("Error searching for characters: \(errorString)")
                    print("Error: \(errorString.localizedDescription)")
                case .finished:
                    //TODO: status here
                    print("Response for charachters received successfully...")
                }
            } receiveValue: { data in
                print("dataCharacters:-->", data)
                self.dataCharacters = data
            }
            .store(in: &suscriptors)
    }
    
    
    //Get data Series
    func getSeries(id: String) {
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getSessionCharacterSeries(id: id))
            .tryMap {
                //We evaluate de response, if it is 200, or not.
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
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
                    print("Error serching for series: \(errorString)")
                case .finished:
                    print("Response for series recived successfully....")
                }
            } receiveValue: { data in
                print("series Data: -->, \(data) ")
                self.seriesData =  data
            }
            .store(in: &suscriptors)
    }
}
