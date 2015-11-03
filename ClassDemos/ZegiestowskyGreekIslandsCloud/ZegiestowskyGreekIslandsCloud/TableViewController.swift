//
//  TableViewController.swift
//  ZegiestowskyGreekIslandsCloud
//
//  Created by Ashley Zegiestowsky on 10/27/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import ParseUI
import Bolts
import Parse 

class TableViewController: PFQueryTableViewController {
    
    //initialize the PFQueryTable table view
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //configure the PFQueryTableView
        self.parseClassName = "Island"
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    //define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "Island")
        query.orderByAscending("name")
        
        //more filtering/querying can be done here
        //query.whereKey("name", equalTo: "Crete")
        //query.whereKey("name", hasPrefix: "C")
        return query
    }
    
    override func viewDidAppear(animated: Bool) {
        //data reloading from parse
        self.loadObjects()
        
        //activate and display the edit button
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            //get the current object from the parse table
            let currentIsland: PFObject = objects![indexPath.row] as! PFObject
            
            //delete object in the background without blocking the app resuming execution
            currentIsland.deleteInBackground()
            
            //reloading from Parse server
            self.loadObjects()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        //create a cell
        var cell = tableView.dequeueReusableCellWithIdentifier("textCell") as! PFTableViewCell!
        
        //ensure the cell exists -- Parse recommends to do this
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "textCell")
        }
        
        //extract values from the PFObject to display in the table view
        if let island = object!["name"] as? String {
            cell?.textLabel?.text = island
        }
        
        if let attractions = object!["attractions"] as? String {
            cell?.detailTextLabel?.text = attractions
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailedVC = segue.destinationViewController as? DetailedViewController,
            
            let indexPath = self.tableView.indexPathForSelectedRow {
                
                if segue.identifier == "segueToDetails" {
                    detailedVC.currentObject = objects![indexPath.row] as? PFObject
                } else if segue.identifier == "segueToNewIsland" {
                    //send an empty object to detailed view
                    detailedVC.currentObject = nil
                }
                
                
        
        }
    }

}
