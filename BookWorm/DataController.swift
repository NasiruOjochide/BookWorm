//
//  DataController.swift
//  BookWorm
//
//  Created by Danjuma Nasiru on 01/02/2023.
//
import CoreData
import Foundation

class DataController: ObservableObject{
    var container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores(completionHandler: {description, error in
            if let error = error{
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        })
    }
}
