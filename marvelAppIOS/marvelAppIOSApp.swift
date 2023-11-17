//
//  marvelAppIOSApp.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 17/11/23.
//

import SwiftUI

@main
struct marvelAppIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
