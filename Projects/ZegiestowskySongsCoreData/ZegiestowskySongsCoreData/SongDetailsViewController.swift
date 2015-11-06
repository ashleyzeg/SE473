//
//  SongDetailsViewController.swift
//  ZegiestowskySongsCoreData
//
//  Created by Ashley Zegiestowsky on 11/5/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import CoreData

class SongDetailsViewController: UIViewController {

    @IBOutlet weak var songName: UITextField!
    @IBOutlet weak var artistName: UITextField!

    @IBAction func saveUpdates(sender: AnyObject) {
        
        //update the values with new text fields
        name = songName.text
        artist = artistName.text
        
        //send new song data from the detailed view
        updateMgr.updateData(song, songName: name, artistName: artist)
        
        //return to table view (without needing to segue back or unwind)
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    var name: String!
    var artist: String!
    var song: NSManagedObject!
    var updateMgr = DataStorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songName.text = name
        artistName.text = artist

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
