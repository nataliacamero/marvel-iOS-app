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
    @Published var dataCharacters: ModelMarvel? //Request data
    @Published var status = Status.none // UI state
    
    var suscriptors = Set<AnyCancellable>()
    
    init() {
        getCharacters()
    }
   
    //Get charachers from API
    func getCharacters() {
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
                    print("Response received successfully...")
                }
            } receiveValue: { data in
                print("data:-->", data)
                self.dataCharacters = data
            }
            .store(in: &suscriptors)
    }
}
