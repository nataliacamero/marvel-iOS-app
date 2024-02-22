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
    @Published var status = Status.none // UI state
    
    var suscriptors = Set<AnyCancellable>()
    
    init(test: Bool = false) {
        
        if test {
            testData()
        }
        else {
            getCharacters()
        }
        
    }
   
    //Get charachers from API
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
                    self.status = Status.error(error: "Error de servidor")
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
                    self.status = Status.error(error: errorString.localizedDescription)
                    print("Error searching for characters: \(errorString)")
                    print("Error: \(errorString.localizedDescription)")
                case .finished:
                    //TODO: status here
                    self.status = Status.loaded
                    print("Response for characters received successfully...")
                }
            } receiveValue: { data in
                print("dataCharacters:-->", data)
                self.dataCharacters = data
            }
            .store(in: &suscriptors)
    }
    
    
    // ---- Testing and Design ----
    
    func testData() {
        // We generated a test model with real answer data from postman
        let hero1 = CharacterList(id: 1009351, name: "Hulk", title: "", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1009351")
        
        
        let hero2 = CharacterList(id: 1009165, name: "Avengers", title: "", description: "Earth's Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle. With a roster that has included Captain America, Iron Man, Ant-Man, Hulk, Thor, Wasp and dozens more over the years, the Avengers have come to be regarded as Earth's No. 1 team.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/20/5102c774ebae7", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1009165")
        
        let data = CharactersData(offset: 0, limit: 0, total: 2, count: 2, results: [hero1,hero2])
        
        self.dataCharacters = ModelMarvel(code: 200, status: "success", copyright: "2020", attributionText: "", attributionHTML: "", etag: "", data: data)
        
        self.status = Status.loaded
    }
    
    func getFakeCharacter() -> CharacterList {
            return CharacterList(id: 1009351, name: "Hulk", title: "", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1009351")
    }
    
}
