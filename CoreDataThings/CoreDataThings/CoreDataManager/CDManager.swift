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
        let container = NSPersistentContainer(name: "CoreDataThings")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                debugPrint(error.localizedDescription)
            }
        })
        return container
    }()

    public var context: NSManagedObjectContext
    {
        return persistentContainer.viewContext
    }
}

extension CDManager
{
    // MARK: - Core Data Saving support
    public func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    public func saveEntity(_ entity: NSManagedObject.Type, info: [String : Any])
    {
        let obj = NSEntityDescription.insertNewObject(forEntityName: "\(entity.self)", into: context)
        obj.y_setValueWithDictionary(data: info)
        saveContext()
    }
    
    public func fetchEntity<T: NSObject>(predicate: NSPredicate? = nil,
                                         sorts: [NSSortDescriptor]? = nil,
                                         offset: Int? = nil,
                                         limit: Int? = nil) -> [T]?
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "\(T.self)")
        if predicate != nil
        {
            request.predicate = predicate
        }
        if sorts != nil
        {
            request.sortDescriptors = sorts!
        }
        if let uo = offset,
           let ul = limit
        {
            request.fetchOffset = uo
            request.fetchLimit  = ul
        }
        return try? context.fetch(request) as? [T]
    }
    
    public func fetchEntityCount(entity: NSManagedObject.Type,
                                 predicate: NSPredicate? = nil,
                                 sorts: [NSSortDescriptor]? = nil) -> Int
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "\(entity.self)")
        request.resultType = .countResultType
        if predicate != nil
        {
            request.predicate = predicate
        }
        if sorts != nil
        {
            request.sortDescriptors = sorts!
        }
        return (try? context.count(for: request)) ?? 0
    }
}



