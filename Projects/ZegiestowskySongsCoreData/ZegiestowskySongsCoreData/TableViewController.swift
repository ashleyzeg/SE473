//
//  TableViewController.swift
//  ZegiestowskySongsCoreData
//
//  Created by Ashley Zegiestowsky on 11/5/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    //create an instance of the DataStorageManager
    var songManager = DataStorageManager()

    @IBAction func addSong(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Song", message: "Add a new Song", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction) -> Void in
            
            let songName = alert.textFields!.first
            let artistName = alert.textFields![1]
            
            self.songManager.saveData("Song", songName: "name", songValue: songName!.text!, artistName: "artist", artistValue: artistName.text!)
            
            self.tableView.reloadData()
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction) -> Void in})
        
        alert.addTextFieldWithConfigurationHandler {
            (songName: UITextField) -> Void in
            songName.placeholder = "Enter song name"
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (artistName: UITextField) -> Void in
            artistName.placeholder = "Enter song artist"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        songManager.fetchData("Song")
        
        self.tableView.reloadData()
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
        return songManager.storedObjects.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath)

        // Configure the cell...
        
        let currentSong = songManager.storedObjects[indexPath.row]
        
        cell.textLabel!.text = currentSong.valueForKey("name") as? String
        cell.detailTextLabel!.text = currentSong.valueForKey("artist") as? String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            songManager.deleteData(indexPath)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "segueToSongDetails" {
            if let detailedVC = segue.destinationViewController as? SongDetailsViewController,
            
                let indexPath = self.tableView.indexPathForSelectedRow {
                    
                    let currentSong: NSManagedObject = songManager.storedObjects[indexPath.row]
                    detailedVC.name = currentSong.valueForKey("name") as? String
                    detailedVC.artist = currentSong.valueForKey("artist") as? String
                    detailedVC.song = currentSong
            }
            
        }
    }

}
