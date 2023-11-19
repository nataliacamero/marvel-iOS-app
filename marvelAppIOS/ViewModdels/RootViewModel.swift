//
//  RootViewModel.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 19/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var characters: [CharacterList]?
    
    var suscriptors = Set<AnyCancellable>()
    
    init() {
        self.getCharacters()
    }
    
    func getCharacters() {
        guard let request = BaseNetwork().getSessionCharactersList() else {
             print("Error: Invalid request")
             return
         }
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap {
                //We evaluate the response, if it is 200 we return the JSON, if not we return exception
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    //Error
                    throw URLError(.badServerResponse)
                }
                
                //Everything is ok
                return $0.data
            }
            .decode(type: [CharacterList].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // We recive it in the main trade
            .sink { completion in
                switch completion {
                case .failure(let errorString):
                    print("Error searching for characters: \(errorString)")
                case .finished:
                    print("Response received successfully...")
                }
            } receiveValue: { data in
                self.characters = data
            }
            .store(in: &suscriptors)
    }
    
}
