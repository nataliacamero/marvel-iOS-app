//
//  BaseNetwork.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 19/11/23.
//

import Foundation //Framework


/*
https://gateway.marvel.com:443/v1/public/characters?
ts=1&apikey=f2ec88156a31feacb4c85986d1ef8ae5&hash=d11d65c42e88cb26cfa5cfb42b126588
*/

/*
 
 Response Headers
 {
   "Content-Type": "application/json; charset=utf-8",
   "Date": "Fri, 17 Nov 2023 20:10:31 GMT"
 }
 */

//Constants
let idCharacter = "1011334"
let privateKey = "aae23710c9097cd7b8794a61d7bb0ad768cd6d6f"
let timeStamp = "ts=1&"
let apiKey = "apikey=f2ec88156a31feacb4c85986d1ef8ae5&"
let md5hash = "hash=d11d65c42e88cb26cfa5cfb42b126588"
let server = "https://gateway.marvel.com:443/v1/public/characters"
let urlCharacterById = "\(server)/\(idCharacter)?\(timeStamp)\(apiKey)\(md5hash)"
let completeCharactersUrl = "\(server)?\(timeStamp)\(apiKey)\(md5hash)"

let urlServer = "https://gateway.marvel.com:443"

//Network stuct methods
struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
}

enum endpoints: String {
    case charactersList = "/v1/public/characters"
}

struct BaseNetwork {
    
    //request for carachteres
    func getSessionCharactersList() -> URLRequest {
        var urlString = "\(urlServer)\(endpoints.charactersList.rawValue)?\(timeStamp)\(apiKey)\(md5hash)"
        urlString += "&orderBy=-modified" // Descending sort
        
        // Creating the request
        var request: URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        print("url", request)
        return request
    }
}


