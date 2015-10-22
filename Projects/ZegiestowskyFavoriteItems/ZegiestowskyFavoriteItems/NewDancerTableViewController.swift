//
//  NewDancerTableViewController.swift
//  ZegiestowskyFavoriteItems
//
//  Created by Ashley Zegiestowsky on 10/21/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

class NewDancerTableViewController: UITableViewController {

    @IBAction func checkForName(sender: AnyObject) {
        if newDancerName.text!.isEmpty {
            
            //create and configure alert controller
            let alertController = UIAlertController(title: "Warning", message: "Name can not be left blank. Please enter a name", preferredStyle: .Alert)
            
            //adds and configure the action button to dismiss alert
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
            
            //present or display the alert box
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func checkForValidStyle(sender: AnyObject) {
        if newDancerStyle.text != "Hip Hop" && newDancerStyle.text != "Contemporary" && newDancerStyle.text != "Tango" && newDancerStyle.text != "Jazz" && newDancerStyle.text != "Ballet" {
            
            //create and configure alert controller
            let alertController = UIAlertController(title: "Warning", message: "Invalid Style: Please enter one of the following styles: Hip Hop, Contemporary, Tango, Jazz, or Ballet", preferredStyle: .Alert)
            
            //adds and configure the action button to dismiss alert
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
            
            //present or display the alert box
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var newDancerName: UITextField!
    @IBOutlet weak var newDancerStyle: UITextField!
    @IBOutlet weak var newDancerImage: UITextField!
    
    var newDancer: Dancer?
    var newDancerImageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newDancerImageName = newDancerImage.text!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

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
        
        if segue.identifier == "segueToNewDancer" {
            newDancer = Dancer(name: newDancerName.text!, style: newDancerStyle.text!, imageName: newDancerImage.text!)
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
