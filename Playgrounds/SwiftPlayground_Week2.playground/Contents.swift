//: Playground - noun: a place where people can play
// Swift Syntax Week 2: Optionals, Arrays, Dictionaries, Loops, Functions

import UIKit

//var str = "Hello, playground"
//
////var optionalMiddleName: String? //use ? for optional variable -- default value is nil
//var optionalMiddleName: String? = "Michelle"
//
//if optionalMiddleName == nil {
//    println("Applicant does not have a middle name")
//}
//
////MARK: Forced Unwrapping -- Use the !
//
//let errorCode = "404"
//let convertedErrorCode: Int? = errorCode.toInt() //converts to the int value
//
////forced unwrapping
//if convertedErrorCode != nil {
//    println("convertedErrorCode has an integer value of \(convertedErrorCode!)")
//} else {
//    println("Non-numeric value found")
//}
//
//
////MARK: Optional Binding--to find out whether an optional has a value or not, and then make the value available as a temporary variable or constant
//
//if let enteredMiddleName = optionalMiddleName {
//    println("Applicant's middle name is \(enteredMiddleName)")
//
//} else {
//    println("Applicant has no middle name")
//}
//
//
////MARK: Implicitly Unwrapped Optionals--use this when it is clear from the structure of your program that optionals will always have a value
//
//let possibleString: String? = "An optional string"
//let forcedString: String = possibleString! //requires an exclamation mark
//
//let assumedString: String! = "An implicitly unwrapped optional string"
//let implicitString: String = assumedString //no ned for !
////rather than putting the ! after the optional's name, each time you use it, you place it after the optionals type when you declare it.


////MARK: Arrays, dictionaries
//
//var shoppingList = ["lemonade", "water", "wine", "black coffee"]
//
//shoppingList[0]
//shoppingList[0] = "something else"
//shoppingList
//shoppingList[1] = shoppingList[0]
//
////Dictionary -- [key/value] pairs
//var occupations = ["George": "Software Engineer",
//                    "Mary": "Software Tester",
//                    "Jon": "Scrum OO Designer" ]
//
//occupations["Mary"]
//occupations["Jon"] = "QA"
//occupations["George"] = occupations["Jon"]
//
////Empty arays, dictionaries
//
//let emptyArray = [String]()
//let emptyDictionary = [String: Double]()
//
////MARK: Traverse an array using a for loop
//
//let individualScores = [45, 55, 65, 34, 67, 89]
//var teamScore = 0
//
//for score in individualScores {
//    if score > 50 {
//        teamScore += 3
//    } else {
//        teamScore += 1
//    }
//}
//
//teamScore
//
//
////Traversing dicitonaries
//
//let interestingNumbers = [
//                "prime": [2, 3, 4, 7, 11, 13],
//                "fibbonacci": [21, 13, 15, 17, 11],
//                "square": [1, 4, 9, 16, 25, 44]
//]
//
//var largest = 0
//for (kind, numbers) in interestingNumbers {
//    for num in numbers {
//        if num > largest {
//            largest = num
//        }
//    }
//}
//
//largest
//
////EXERCISE: 
////1. Print every number from 1 to 100 (use a for loop 1..100)
////2. If the number is divisible by 3 then print Div3
////3. If the number is divisible by 5 then print Div5
////4. If the number is divisible by both 3 and 5 then print Div3 Div5
//
//for number in 1...100 {
//    if (number % 3 == 0 && number % 5 == 0) {
//        println("Div3 and Div5 \(number)")
//    } else if (number % 3 == 0) {
//        println("Div3 \(number)")
//    } else if (number % 5 == 0) {
//        println("Div5 \(number)")
//    } else {
//        println(number)
//    }
//}
//
////MARK: Functions
//
//func voidFunction() {
//    println("nothing to do and nothing to return")
//}
//
//voidFunction()
//
//func greet(name: String, day: String) -> String {
//    return "Hi \(name), today is \(day)!"
//}
//
//greet("Ashley", "Monday")
//
//
//func getGasPrices() -> (p1: Double, p2: Double, p3: Double) {
//    return (3.5, 5.6, 6.7)
//}
//
//getGasPrices()

//Passing Variadic Parameters

//func sumOf(numbers: Int...) -> Int {
//    
//    var sum = 0
//    for num in numbers {
//        sum += num
//    }
//    return sum
//}
//
//sumOf()
//sumOf(1,2,3,4,5)

////NSDate
//
//func now() -> NSDate {
//    return NSDate()
//}
//
//now()
//
////Returning more than a single value
//
//func sumAndAvgOf(numbers: Double...) -> (Double, Double) {
//    
//    var sum = 0.0
//    var avg = 0.0
//    
//    for num in numbers {
//        sum += num
//    }
//    
//    avg = sum / Double(numbers.count)
//    
//    return (sum, avg)
//}
//
//sumAndAvgOf(1,2,3,4,5).0
//
//
//
////Nesting of functions
//
//func addFive(number: Int) -> Int {
//    
//    func add(num: Int) -> Int {
//        return num + 5
//    }
//    
//    return add(number)
//}
//
//addFive(10)

//A function that returns another function

//func makeIncrement(functionIndex: Int) -> (Int -> Int) {
//    
//    func addOne(number: Int) -> Int {
//        return number + 1
//    }
//    
//    func addTwo(number: Int) -> Int {
//        return number + 2
//    }
//    
//    return functionIndex == 1 ? addOne : addTwo
//}
//
//var increment2 = makeIncrement(2)
//
//increment2(5)
//
//var increment1 = makeIncrement(1)
//
//increment1(10)
//
////Function that uses another function as a parameter
//
//func hasMatches(list: [Int], condition: Int -> Bool) -> Bool {
//    
//    for item in list {
//        if condition(item) {
//            return true
//        }
//    }
//    
//    return false
//}
//
//func lessThanTen(number: Int) -> Bool {
//    
//    return number < 10
//}
//
//var numbers = [11, 12, 15, 13, 19, 10, 3]
//
//hasMatches(numbers, lessThanTen)
//
////EXERCISE: matching with average of a list of numbers
//
//var list = [11, 12, 13, 22, 35, 18]
//
//func avgMatch(list: [Int], avg: [Int] -> Int) -> Bool{
//    
//    for item in list {
//        if item == avg(list) {
//            return true
//        }
//    }
//    return false
//}
//
//func avg(numbers: [Int]) -> Int {
//    
//    var sum = 0
//    for num in numbers {
//        sum += num
//    }
//    
//    return sum / numbers.count
//}
//
//avgMatch(list, avg)

//Returning optional values

//let numbersList = [1, 2, 0, 5, 11, 22, 45]
let numbersList = [Int]()

func minMax(list: [Int]) -> (min: Int, max: Int)? { //optional ? is used to handle the case of an empty array
    
    
    if list.isEmpty {
        
        //return (0,0)
        return nil
        
    } else {
        var currentMin = list[0]
        var currentMax = list[0]
        
        for num in list {
            if num < currentMin {
                currentMin = num
            } else if num > currentMax {
                currentMax = num
            }
        }
        return (currentMin, currentMax)
    }
    
}

//Optional Binding

if let bounds = minMax(numbersList) {
    println("Min is \(bounds.min) and Max is \(bounds.max)")
} else {
    println("Empty List")
}

//Use inout to pass by reference

func swapValues(inout a: Int, inout b: Int) {
    var c = a
    a = b
    b = c
}

var firstInt = 1
var secondInt = 22

//notice the use of &
swapValues(&firstInt, &secondInt)

firstInt
secondInt

//Passing variable parameters

func testFunc (var p1: Int, v2: Int, v3: Int) {
    //change the value of p1 inside the body of the function
    
    
}




















