//
//  ViewController.swift
//  ZegiestowskyTipCalculator
//
//  Created by Ashley Zegiestowsky on 9/22/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

//This and other tutorials can be found at www.raywenderlich.com

class ViewController: UIViewController {

    @IBOutlet weak var billTotal: UITextField!
    
    @IBOutlet weak var taxPercentageSlider: UISlider!
    
    @IBOutlet weak var taxPercentageLabel: UILabel!
    
    @IBOutlet weak var resultsTextView: UITextView!
    
    //create a tipCalculator object
    var myTipCalculator = TipCalculator(total: 0.0, taxPercentage: 0.0)
    
    //create all possible tip percentages
    let tipPercentages = [0.20, 0.18, 0.15]
    
    @IBAction func calculateBtnTapped(sender: AnyObject) {
        
        myTipCalculator.total = (billTotal.text as NSString!).doubleValue
        
        let possibleTips = myTipCalculator.calcPossibleTips(tipPercentages)
        
        var results = ""
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        
        resultsTextView.text = results
        
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        
        myTipCalculator.taxPercentage = Double(taxPercentageSlider.value) / 100.0
        
        taxPercentageLabel.text = "Tax Percentage (\(Int(taxPercentageSlider.value))%)"
        
        resultsTextView.text = ""
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

