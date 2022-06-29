//
//  ContactsApp.swift
//  Contacts
//
//  Created by Luann Luna on 26/05/22.
//

import SwiftUI

@main
struct ContactsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
