//
//  NewIslandTableViewController.swift
//  ZegiestowskyGreekIslandsWithSegue
//
//  Created by Ashley Zegiestowsky on 10/6/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

class NewIslandTableViewController: UITableViewController {

    @IBAction func checkForValidRegion(sender: AnyObject) {
        if newIslandRegion.text != "South" && newIslandRegion.text != "North" {
            
            //create and configure alert controller
            let alertController = UIAlertController(title: "Warning", message: "Invalid Region Name. Please enter one of the valid regions: 'South' or 'North'.", preferredStyle: .Alert)
            
            //adds and configure action button to dismiss alert
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
            
            //present or display the alert box
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var newIslandName: UITextField!
    @IBOutlet weak var newIslandAttractions: UITextField!
    @IBOutlet weak var newIslandImage: UITextField!
    @IBOutlet weak var newIslandRegion: UITextField!
    
    var newIsland: GreekIsland?
    var newIslandImageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newIslandImageName = newIslandImage.text!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */
    
    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "sequeToNewIsland" {
            newIsland = GreekIsland(name: newIslandName.text!, attractions: newIslandAttractions.text!, imageName: newIslandImage.text!)
            
            newIsland?.region = newIslandRegion.text
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
