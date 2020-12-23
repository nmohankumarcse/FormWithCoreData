//
//  FormWithCoreDataApp.swift
//  FormWithCoreData
//
//  Created by N., Mohankumar (Cognizant) on 23/12/20.
//

import SwiftUI

@main
struct FormWithCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
