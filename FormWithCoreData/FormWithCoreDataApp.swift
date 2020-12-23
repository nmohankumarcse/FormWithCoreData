//
//  FormWithCoreDataApp.swift
//  FormWithCoreData
//
//  Created on 23/12/20.
//

import SwiftUI

@main
struct FormWithCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            GarmentList().environmentObject(GarmentViewModel()).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
