//
//  TableViewController.swift
//  ZegiestowskyFavoriteItems
//
//  Created by Ashley Zegiestowsky on 10/21/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {

    //create an array of Dancer objects
    var dancerList = [Dancer]()
    
    var filteredDancerList = [Dancer]()
    
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let IanEastwood = Dancer(name: "Ian Eastwood", style: "Hip Hop", imageName: "ie.jpg")
        let JanelleGinestra = Dancer(name: "Janelle Ginestra", style: "Hip Hop", imageName: "jg.jpg")
        let TriciaMiranda = Dancer(name: "Tricia Miranda",style: "Hip Hop", imageName: "tm.jpg")
        let TravisWall = Dancer(name: "Travis Wall", style: "Contemporary", imageName: "tw.jpg")
        let MoraGodoy = Dancer(name: "Mora Godoy", style: "Tango", imageName: "mg.jpg")
        
        dancerList = [IanEastwood, JanelleGinestra, TriciaMiranda, TravisWall, MoraGodoy]
        
        //configure the search controller at load time
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if self.resultSearchController.active {
            return self.filteredDancerList.count
        } else {
            return self.dancerList.count
        }
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        //empty the filteredDancerList array
        filteredDancerList.removeAll(keepCapacity: false)
        
        //create a search predicate from the searchbar text
        let searchPredicate = NSPredicate(format: "SELF contains %@", searchController.searchBar.text!)
        
        //build a new list with the search filtered data
        let filteredList = (dancerList as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        //populate the filteredDancerList
        filteredDancerList = filteredList as! [Dancer]
        
        //reload the data
        self.tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath)

        // Configure the cell...
        
        if self.resultSearchController.active {
            cell.textLabel?.text = filteredDancerList[indexPath.row].name
            cell.detailTextLabel?.text = filteredDancerList[indexPath.row].style
            cell.imageView?.image = filteredDancerList[indexPath.row].image
            
        } else {
            cell.textLabel?.text = dancerList[indexPath.row].name
            cell.detailTextLabel?.text = dancerList[indexPath.row].style
            cell.imageView?.image = dancerList[indexPath.row].image
        }

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
            
            dancerList.removeAtIndex(indexPath.row)
            
            let indexPath = NSIndexPath(forRow: indexPath.row, inSection: indexPath.section)
            
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
        
        var currentDancer: Dancer!
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            currentDancer = dancerList[indexPath.row] as Dancer!
    
        
        
            let videoVC = segue.destinationViewController as! VideoViewController
        
            switch currentDancer.name {
            case "Ian Eastwood":
                videoVC.url = "https://www.youtube.com/watch?v=GalM9LBamAQ"
            case "Janelle Ginestra":
                videoVC.url = "https://www.youtube.com/watch?v=KE5d8JYVdNw"
            case "Tricia Miranda":
                videoVC.url = "https://www.youtube.com/watch?v=4TnUePIxP8I"
            case "Travis Wall":
                videoVC.url = "https://www.youtube.com/watch?v=khvcCpoFszM"
            case "Mora Godoy":
                videoVC.url = "https://www.youtube.com/watch?v=GlqgBE23qMM"
            default:
                videoVC.url = "https://www.youtube.com/user/UrbanDanceCamp"
            }
        }
        
        
    }
    
    //Mark: Unwinding
    
    @IBAction func cancelToDancerViewController(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func saveNewDancer(segue: UIStoryboardSegue) {
        //create a new Dancer view controller
        if let newDancerVC = segue.sourceViewController as? NewDancerTableViewController {
            
            //create a new dancer
            if let newDancer = newDancerVC.newDancer {
                dancerList.append(newDancer)
                let newIndexPath = NSIndexPath(forRow: dancerList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    
    

}
