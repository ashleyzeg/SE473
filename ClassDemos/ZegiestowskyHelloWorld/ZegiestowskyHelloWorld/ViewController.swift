//
//  ViewController.swift
//  ZegiestowskyHelloWorld
//
//  Created by Ashley Zegiestowsky on 9/17/15.
//  Copyright (c) 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picImage: UIImageView!
    
    @IBOutlet weak var labelMessageDisplay: UILabel!
    
    @IBOutlet weak var textInputField: UITextField!
    
    @IBAction func tapMeButton(sender: AnyObject) {
        
        labelMessageDisplay.text = textInputField.text
        
        labelMessageDisplay.backgroundColor = UIColor.blueColor()
        
        picImage.hidden = false
    }
    
    @IBOutlet weak var switchDisplay: UISwitch!
    
    @IBAction func switchEvent(sender: AnyObject) {
        if switchDisplay.on {
            picImage.hidden = false
        } else {
            picImage.hidden = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.brownColor()
        picImage.hidden = false
    }


}

