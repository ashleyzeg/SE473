//
//  TipCalculatorModel.swift
//  ZegiestowskyTipCalculator
//
//  Created by Ashley Zegiestowsky on 9/22/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import Foundation

class TipCalculator {
    
    var total: Double
    var taxPercentage: Double
    
    init(total: Double, taxPercentage: Double) {
        
        self.total = total
        self.taxPercentage = taxPercentage
    }
    
    //computed attribute
    var subtotal: Double {
        
        get {
            return total / (taxPercentage + 1)
        }
    }
    
    //method to calculate the tip on the subtotal based on a tip percentage
    func calcTip(tipPercentage: Double) -> Double {
        return round(subtotal * tipPercentage)
    }
    
    func calcPossibleTips(percentages: [Double]) -> [Int: Double] {
        
        //create a tips dictionary
        var tipsDictionary = [Int: Double]() //when creating an empty dictionary you need parenthesis at the end
        
        for pct in percentages {
            
            let intPct = Int(pct * 100)
            tipsDictionary[intPct] = calcTip(pct)
        }
        
        return tipsDictionary
    }
    
}