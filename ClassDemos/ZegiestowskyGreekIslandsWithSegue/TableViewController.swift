//
//  TableViewController.swift
//  ZegiestowskyGreekIslandsWithSegue
//
//  Created by Ashley Zegiestowsky on 9/29/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //create an array of GreekIsland objects
    var islandsList = [GreekIsland]()
    
    var northernIslands = [GreekIsland]()
    var southernIslands = [GreekIsland]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let santorini = GreekIsland(name: "Santorini", attractions: "Best sunsets, ideal for weddings and honey mooners", imageName: "santorini.jpg")
        let mykonos = GreekIsland(name: "Mykonos", attractions: "Best nightlife and club scene", imageName: "mykonos.jpg")
        let corfu = GreekIsland(name: "Corfu", attractions: "Best nature and clear water", imageName: "corfu.jpg")
        let skiathos = GreekIsland(name: "Skiathos", attractions: "Amazing greek food", imageName: "skiathos.jpg")
        let zakynthos = GreekIsland(name: "Zakynthos", attractions: "Great nature and green", imageName: "zakynthos.jpg")
        let crete = GreekIsland(name: "Crete", attractions: "Everything for everyone", imageName: "crete.jpg")
        
        islandsList = [santorini, mykonos, crete, corfu, zakynthos, skiathos]
        northernIslands = [santorini, corfu]
        southernIslands = [mykonos, skiathos, crete, zakynthos]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //return number of rows for each section
        switch section {
        case 0:
            return northernIslands.count
        case 1:
            return southernIslands.count
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell")
        
        headerCell?.backgroundColor = UIColor.cyanColor()
        
        switch section {
        case 0:
            headerCell?.textLabel!.text = "Northern Islands"
        case 1:
            headerCell?.textLabel!.text = "Southern Islands"
        default: break
        }
        
        return headerCell
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath)

        // Configure the cell...
        let row = indexPath.row
        
//        cell.textLabel?.text = islandsList[row].name
//        cell.detailTextLabel?.text = islandsList[row].attractions
//        cell.imageView?.image = islandsList[row].image
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = northernIslands[row].name
            cell.detailTextLabel?.text = northernIslands[row].attractions
            cell.imageView?.image = northernIslands[row].image
        case 1:
            cell.textLabel?.text = southernIslands[row].name
            cell.detailTextLabel?.text = southernIslands[row].attractions
            cell.imageView?.image = southernIslands[row].image
        default: break
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
            
            switch indexPath.section {
                
            case 0:
                //remove the selected island from the array
                northernIslands.removeAtIndex(indexPath.row)
            case 1:
                southernIslands.removeAtIndex(indexPath.row)
            default: break
            }
            
            let indexPath = NSIndexPath(forRow: indexPath.row, inSection: indexPath.section)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            
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
        
        var currentIsland: GreekIsland!
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            // Get the new view controller using segue.destinationViewController.
            
            switch indexPath.section {
            case 0:
                currentIsland = northernIslands[indexPath.row] as GreekIsland
            case 1:
                currentIsland = southernIslands[indexPath.row] as GreekIsland
            default: break
            }
            
            let detailedVC = segue.destinationViewController as! DetailsViewController
            
            switch currentIsland.name {
                case "Santorini":
                    detailedVC.url = "http://www.tripadvisor.com/Tourism-g189433-Santorini_Cyclades_South_Aegean-Vacations.html"
                case "Mykonos":
                    detailedVC.url = "http://www.tripadvisor.com/Tourism-g189430-Mykonos_Cyclades_South_Aegean-Vacations.html"
                case "Crete":
                    detailedVC.url = "http://www.tripadvisor.com/Tourism-g189413-Crete-Vacations.html"
                case "Corfu":
                    detailedVC.url = "http://www.tripadvisor.com/Tourism-g189458-Corfu_Ionian_Islands-Vacations.html"
                case "Skiathos":
                    detailedVC.url = "http://www.tripadvisor.com/Tourism-g189499-Skiathos_Sporades-Vacations.html"
                case "Zakynthos":
                    detailedVC.url = "http://www.tripadvisor.com/Tourism-g189462-Zakynthos_Ionian_Islands-Vacations.html"
                default:
                    detailedVC.url = "http://www.visitgreece.gr/en/greek_islands"
        
            }
            
        }
        
        
        
        // Pass the selected object to the new view controller.
    }
    //MARK: Unwinding
    
    @IBAction func cancelToIslandViewController(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func saveNewIsland(segue: UIStoryboardSegue) {
        //create a new Island view controller
        if let newIslandVC = segue.sourceViewController as? NewIslandTableViewController {
            
            //create a new island
            if let newIsland = newIslandVC.newIsland {
                if newIsland.region == "South" {
                    southernIslands.append(newIsland)
                    let newIndexPath = NSIndexPath(forRow: southernIslands.count - 1, inSection: 1)
                    tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
                } else if newIsland.region == "North" {
                    northernIslands.append(newIsland)
                    let newIndexPath = NSIndexPath(forRow: northernIslands.count - 1, inSection: 0)
                    tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
                }
            }
        }
    }
}
