//
//  ViewController.swift
//  ZegiestowskyCalculatorApp
//
//  Created by Ashley Zegiestowsky on 10/5/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayResult: UILabel!
    @IBOutlet weak var decimalBtn: UIButton!
    
    var isFirstDigit: Bool = true
    //var val1: Double? = 0
    //var val2: Double? = 0
    var currentOp: String? = ""
    var calcObj = CalculatorModel(val1: 0, val2: 0)
    
    var result: Double {
        get {
            return Double(displayResult.text! as String)!
        }
        set {
            displayResult.text = "\(newValue)"
            //isFirstDigit = true
        }
    }
    
    @IBAction func clearTapped(sender: AnyObject) {
        //displayResult.text = "0"
        result = 0
        isFirstDigit = true
        decimalBtn.enabled = true
    }
    
    @IBAction func changeSign(sender: AnyObject) {
//        let firstChar = displayResult.text?.startIndex
//        let lastChar = displayResult.text?.endIndex
//        if displayResult.text?[firstChar!] == "-" {
//            displayResult.text = displayResult.text?[1..lastChar!]
//        } else {
//            displayResult.text = "-" + displayResult.text!
//        }
        result = -result
        
    }
    
    @IBAction func appendDigit(sender: AnyObject) {
        let digit = sender.currentTitle!
        
        if isFirstDigit && digit == "0" {
            isFirstDigit = true
        } else if isFirstDigit && digit == "." {
            displayResult.text = "0" + digit!
            isFirstDigit = false
        } else if isFirstDigit {
            displayResult.text = digit
            isFirstDigit = false
        } else {
            displayResult.text = displayResult.text! + digit!
            isFirstDigit = false
        }
        
        if digit == "." {
            decimalBtn.enabled = false
        }
        
    }
    
    @IBAction func storeOperator(sender: AnyObject) {
        currentOp = sender.currentTitle
        calcObj.val1 = result
        isFirstDigit = true
        decimalBtn.enabled = true
    }
 
    @IBAction func calculate(sender: AnyObject) {
        calcObj.val2 = result
        switch currentOp! {
            case "+":
                result = calcObj.add()
            case "-":
                result = calcObj.subtract()
            case "x":
                result = calcObj.multiply()
            case "/":
                result = calcObj.divide()
            case "%":
                result = calcObj.modular()
            case "^":
                result = calcObj.power()
            default: break
        }
        
        decimalBtn.enabled = true
        isFirstDigit = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayResult.text = "0"
        displayResult.backgroundColor = UIColor.darkGrayColor()
        
    } 

}

