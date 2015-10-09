//
//  DetailsViewController.swift
//  ZegiestowskyGreekIslandsWithSegue
//
//  Created by Ashley Zegiestowsky on 9/29/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var websiteDisplay: UIWebView!
    
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        
        websiteDisplay.loadRequest(request)

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
