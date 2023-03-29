//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Danjuma Nasiru on 01/02/2023.
//

import SwiftUI

@main
struct BookWormApp: App {
    
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
