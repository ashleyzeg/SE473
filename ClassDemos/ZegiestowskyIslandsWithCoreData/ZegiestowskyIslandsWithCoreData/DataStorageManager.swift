//
//  DataStorageManager.swift
//  ZegiestowskyIslandsWithCoreData
//
//  Created by Ashley Zegiestowsky on 10/20/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataStorageManager {
    
    //create a list of NSManagedObjects needed by CoreData
    var storedObjects = [NSManagedObject]()
    
    func fetchData(entity: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: entity)
        
        //typical do-block for error checking
        do {
            //fetch the managed context
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            storedObjects = results as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    func saveData(entityName: String, attributeName: String, attributeValue: String) {
        //setup and access the NSManagedContext
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //create an entity for the table
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: managedContext)
        
        //create an stored object
        let storedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //set the name of the island
        storedObject.setValue(attributeValue, forKey: attributeName)
        
        //typical do-block for error checking
        do {
            //save the managed context
            try managedContext.save()
            
            //update the data source
            storedObjects.append(storedObject)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func deleteData(indexPath: NSIndexPath) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        managedContext.deleteObject(storedObjects[indexPath.row] as NSManagedObject)
        
        //remove it from the data source
        storedObjects.removeAtIndex(indexPath.row)
        
        //typical do-block for error checking
        do {
            //save the managed context
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not delete \(error), \(error.userInfo)")
        }
        
    }
    
    func updateData() {
        
    }
}