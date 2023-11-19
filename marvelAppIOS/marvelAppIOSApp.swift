//
//  marvelAppIOSApp.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 17/11/23.
//

import SwiftUI

@main
struct marvelAppIOSApp: App {
    let persistenceController = PersistenceController.shared //Core data

    //ViewMOdel global
        @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            CharactersListView(characters: charactersArray)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(rootViewModel)
        }
    }
}
