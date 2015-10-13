//
//  TableViewController.swift
//  ZegiestowskyIslandsWithCoreData
//
//  Created by Ashley Zegiestowsky on 10/13/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    //create a list of NSManagedObjects needed for CoreData
    
    var islands = [NSManagedObject]()
    
    
    @IBAction func addIsland(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Island", message: "Add a new Island", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            
            self.saveName(textField!.text!)
            
            self.tableView.reloadData()
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction) -> Void in})
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveName(name: String) {
        //setup and access the NSManagedContext
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //create an entity for the Island table
        let entity = NSEntityDescription.entityForName("Island", inManagedObjectContext: managedContext)
        
        //create an Island instance
        let island = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //set the name of the island 
        island.setValue(name, forKey: "name")
        
        //typical do-block for error checking 
        do {
            //save the managed context
            try managedContext.save()
            
            //update the data source
            islands.append(island)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Island")
        
        //typical do-block for error checking
        do {
            //fetch the managed context
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            islands = results as! [NSManagedObject]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return islands.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath)

        // Configure the cell...

        let currentIsland = islands[indexPath.row]
        
        cell.textLabel!.text = currentIsland.valueForKey("name") as? String
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
