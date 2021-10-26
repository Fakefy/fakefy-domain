//
//  TestCoreDataStack.swift
//  TouchTunes SDK Tests
//
//  Created by Ney Moura on 19/10/21.
//

import CoreData

class TestCoreDataStack {
    
    private let dataModelName: String = "TouchTunes SDK"
    private let configurationName: String = "Default"
        
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: dataModelName)

        let inMemoryStore = NSPersistentStoreDescription()
        inMemoryStore.url = URL(fileURLWithPath: "/dev/null")
        
        container.persistentStoreDescriptions = [inMemoryStore]
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
