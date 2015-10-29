//
//  DetailedViewController.swift
//  ZegiestowskyGreekIslandsCloud
//
//  Created by Ashley Zegiestowsky on 10/29/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import Parse

class DetailedViewController: UIViewController {

    @IBOutlet weak var islandName: UITextField!
    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var islandImage: UIImageView!
    @IBOutlet weak var islandAttractions: UITextView!
    
    //container to store the segued object from the table view controller
    
    var currentObject: PFObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentIsland = currentObject {
            islandName.text = currentIsland["name"] as? String
            islandAttractions.text = currentIsland["attractions"] as? String
            imageName.text = currentIsland["image"] as? String
            
            if let imageName = currentIsland["image"] as? String {
                islandImage.image = UIImage(named: imageName)
            } else { self.title = "No image available for \(islandName.text!)"
            }
        }

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
