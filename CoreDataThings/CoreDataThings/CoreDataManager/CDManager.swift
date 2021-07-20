//
//  CDManager.swift
//  CoreDataThings
//
//  Created by 任斌 on 2021/7/20.
//

import Foundation
import CoreData

public class CDManager: NSObject
{
    public static let shared = CDManager()
    
    private override init() {}
    
    // MARK: - Core Data stack
    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CDTest2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                debugPrint(error.localizedDescription)
            }
        })
        return container
    }()

}


extension CDManager
{
    // MARK: - Core Data Saving support
    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
}
