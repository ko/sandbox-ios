//
//  PersonManager.swift
//  CoreData
//
//  Created by Ken Ko on 6/21/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit
import CoreData

var personMgr: PersonEntityManager = PersonEntityManager()

class PersonEntityManager: NSObject {
    
    func _get_context() -> NSManagedObjectContext {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        return context
    }
    
    func addPerson(name: String!) {
        let context: NSManagedObjectContext = self._get_context()
        let entity = NSEntityDescription.entityForName("PersonEntity", inManagedObjectContext: context)
        var person = PersonEntity(entity: entity, insertIntoManagedObjectContext: context)
        
        person.name = name
        
        context.save(nil)
    }
    
    func newName(person: AnyObject!, name: String) {
        let context: NSManagedObjectContext = self._get_context()
        let index: Int = self.getPerson().indexOfObject(person)
        
        NSLog("index=\(index)")
        
        var person: AnyObject! = self.getPerson().objectAtIndex(index)
        
        NSLog("index=\(index), person.name=\(person.name)")
        
        person.setValue(name, forKey:"name")
        
        context.save(nil)
    }
    
    func getFirstPerson() -> AnyObject! {
        let persons: NSArray = self.getPerson()
        
        NSLog("objectAtIndex(0): \(persons.objectAtIndex(0))")
        
        return persons.objectAtIndex(0)
    }
    
    func getPerson() -> NSArray {
        let context: NSManagedObjectContext = self._get_context()
        let request: NSFetchRequest = NSFetchRequest(entityName: "PersonEntity")
        
        request.returnsObjectsAsFaults = false
        request.predicate = nil
        
        var fetchedPerson: NSArray = context.executeFetchRequest(request, error: nil)
        
        return fetchedPerson
    }
    
    func delPerson(item: AnyObject) {
        let context = self._get_context()

        context.deleteObject(item as NSManagedObject)
        context.save(nil)
    }
}