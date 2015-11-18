//
//  TableViewController.swift
//  ZegiestowskyRecipeBook
//
//  Created by Ashley Zegiestowsky on 11/17/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Bolts

class TableViewController: PFQueryTableViewController {

    //initialize the PFQueryTable table view
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //configure the PFQueryTableView
        self.parseClassName = "Recipe"
        self.textKey = "name"
        self.imageKey = "image"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
    }
    
    //define the query that will provide the data for the query
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "Recipe")
        //sort recipes alphabetically
        query.orderByAscending("name")
        
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
            let currentRecipe: PFObject = objects![indexPath.row] as! PFObject
            
            //delete object in the background without blocking the app resuming execution
            currentRecipe.deleteInBackground()
            
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
        if let recipe = object!["name"] as? String {
            cell?.textLabel?.text = recipe
        }
        
        if let category = object!["category"] as? String {
            cell?.detailTextLabel?.text = category
        }
        
        //TODO: image not loading
        if let image = object!["image"] as? String {
            cell?.imageView?.image = UIImage(named: image)
        } else { self.title = "No image available"
        }
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let recipeDetailsVC = segue.destinationViewController as? RecipeDetailsViewController,
            
            let indexPath = self.tableView.indexPathForSelectedRow {
                
                if segue.identifier == "segueToNewRecipe" {
                    recipeDetailsVC.currentObject = nil
                } else if segue.identifier == "segueToRecipeDetails" {
                    recipeDetailsVC.currentObject = objects![indexPath.row] as? PFObject
                }
                
                
        }
    }
    

}
