//
//  CalculatorModel.swift
//  ZegiestowskyCalculatorApp
//
//  Created by Ashley Zegiestowsky on 10/9/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    var val1: Double
    var val2: Double
    
    init(val1: Double, val2: Double) {
        self.val1 = val1
        self.val2 = val2
    }
    
    func add() -> Double {
        return val1 + val2
    }
    
    func subtract() -> Double {
        return val1 - val2
    }
    
    func multiply() -> Double {
        return val1 * val2
    }
    
    func divide() -> Double {
        return val1 / val2
    }
    
    func modular() -> Double {
        return val1 % val2
    }
    
    func power() -> Double {
        return pow(val1, val2)
    }
    
}