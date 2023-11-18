//
//  KeyChain.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 18/11/23.
//

import Foundation
import KeychainSwift //Librerias de tercs


//Guardamos
func saveKeyChain(key: String, value: String) -> Bool {
    //Convirtiendo cadena value en data con condificacion utf8
    if let data = value.data(using: .utf8) {
        let keyChain = KeychainSwift()
        return keyChain.set(data, forKey: key)
    } else {
        //No desempqueta
        return false
    }
}

//Leemos
func loadKeyChan(key:String) -> String? {
    if let data = KeychainSwift().get(key) {
        return data
    } else {
        return ""
    }
}

//Borramos
func deleteKeyChain(key: String) -> Bool {
    KeychainSwift().delete(key)
}

