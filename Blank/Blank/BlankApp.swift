//
//  BlankApp.swift
//  Blank
//
//  Created by Luann Luna on 09/06/22.
//

import SwiftUI

@main
struct BlankApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
