//
//  DetailsViewController.swift
//  ZegiestowskyIslandsWithCoreData
//
//  Created by Ashley Zegiestowsky on 10/22/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {

    @IBOutlet weak var islandName: UITextField!
    @IBAction func saveUpdates(sender: AnyObject) {
        
        //update the values with new text fields
        name = islandName.text
        
        //send new island data from the detailed view
        updateMgr.updateData(island, name: name)
        
        //return to table view (without needing to segue back or unwind)
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    var name: String!
    var island: NSManagedObject!
    var updateMgr = DataStorageManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        islandName.text = name
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
