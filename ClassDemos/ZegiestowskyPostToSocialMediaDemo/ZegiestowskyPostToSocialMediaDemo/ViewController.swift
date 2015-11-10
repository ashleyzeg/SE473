//
//  ViewController.swift
//  ZegiestowskyPostToSocialMediaDemo
//
//  Created by Ashley Zegiestowsky on 11/10/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import Social

//When ready to run the app make sure you go to the simulator (or iphone) and go to 
//Hardware > Home > Settings and login to your Facebook/Twitter account

class ViewController: UIViewController {

    @IBAction func postToTwitter(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            
            let controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            controller.setInitialText("Testing a post on my timeline")
            
            self.presentViewController(controller, animated: true, completion: nil)
            
        } else {
            
            print("No Twitter account on this device")
        }
    }
    
    @IBAction func postToFacebook(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            
            let controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            controller.setInitialText("Testing a post on my timeline")
            
            self.presentViewController(controller, animated: true, completion: nil)
        
        } else {
            
            print("No Facebook account on this device")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

