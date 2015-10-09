//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
////MARK: Declaring variables and constants -- explicit and implicit/inferred
////variable naming convention = camelCase
//
//var myIntVariable = 2 //implicit (data type is not declared)
//
//var myIntExplicit: Int = 2 //explicit (data type is declared)
//
//var explicitDouble: Double //explicit
//
//var explicitMyDouble: Double = 0.9 //explicit
//
//var implicitFloat = 0.99999 //implicit
//
//var explicitFloat: Float = 0.99999 //explicit
//
//var myString = "Hello"
//
//var anotherString: String = "Hey There"
//
//var explicitInt: Int
//
//explicitInt = 3
//
//
////MARK: let is for constants
//
//let myNumber = 99
//
//myNumber
//
//let anotherNumber: Double = 0.765
//
//let myExplicitFlag: Bool = false
//
//let implicitFlag = true
//
//let myLabel = "The width is"
//
////MARK: Casting (converting one data type to another data type)
//
//let width = 5
//
//let widthLabel = myLabel + " " + String(width) //Casting from integer to string
//
//Int(anotherNumber) //Casting of Double to Int
//
//Double(myNumber) //Casting of Int to Double
//
//
////MARK: Arithmetic Operators and Expressions
//
//let five = 5
//let six = 6
//let eleven = five + six
//
//let eight = 4 * 2
//
//let remainder = 9 % 2 //modulo or mod operator
//
//let fifty = 100 / 2
//
//let positiveEleven = +eleven
//
//let negativeEleven = -eleven
//
//var number = 10
//
//
////MARK: Increment Operator
//
//++number //increments before returning value
//number
//
//number++ //increments after returning value
//number
//
////Another Example
//
//var x = 0
//
//let y = ++x //x, y are both 1
//x
//
//let w = x++ //x is 2, but w is set to the pre-incremented value of 1
//x
//
//// ++x is equivalant to 
//
//x += 1
//
//x = x + 1
//
//// EXERCISE: Can you try the same with -- operator
//
//var a = 10
//
//let b = --a
//a
//
//let c = a--
//a
//
//// --x is equivalant to
//
//x -= 1
//
//x = x - 1
//
//
//
////MARK: Relational/Comparison Operators and Boolean Expressions
//
//1 == 1 // eqaul
//
//2 != 1 // not equal
//
//2 > 1 // greater than
//
//1 < 2 // less than
//
//1 >= 1 // greater than or equal
//
//1 <= 1 // less than or equal
//
//
//// Boolean Operators: && (and) || (or) ! (not)
//
//(1 == 1) && (1 < 2)
//
//true && true && false
//
//true || false || true
//
//!false
//
//!true
//
//
////MARK: Strings and Interpolation
//
//let hello = "Hello"
//
//let world: String = "World"
//
////Concatination of strings
//
//let helloWorld = hello + " " + world
//
//var num1 = 10
//
//var num2 = 45
//
////Interpolation insert numeric values inside a string \(numeric value)
//
//var myStringDemo = "The first number value is \(num1) and the second number is \(num2)"
//
//helloWorld.isEmpty
//
//helloWorld.hasSuffix("World")
//
//helloWorld.hasPrefix("Hello")
//
//helloWorld.rangeOfString("or")


//MARK: Tuples
//
//let errorMessage = (404, "Incorrect URL")
//
//println(errorMessage.0)
//println(errorMessage.1)
//
//let (statusCode, statusMessage) = errorMessage
//
//println("The status code is \(statusCode)")
//
//println("The error message is \(statusMessage)")
//
//let errorMessage2 = (code: 444, description: "Some error")
//
//errorMessage2.code
//errorMessage2.description
//
//
////MARK: Decisions if-else-if-else
//
//var tempratureInFarenheit = 90
//if tempratureInFarenheit <= 32 {
//    println("It is cold")
//} else if tempratureInFarenheit >= 86 {
//    println("It is very hot")
//} else {
//    println("It is pleasant")
//}
//
//
////MARK: Ternary Conditional Operator
//
////syntax: question? value1 : value2
//
//5 > 3 ? 1 : 2
//
//4 == 4 ? 10 : 5
//
//
////MARK: Conditional Assignment
//
//var num1 = 1
//var num2 = 2
//var result = 0
//
//result = num1 > num2 ? 11 : 12
//
////equivalant to
//if num1 < num2 {
//    result = 11
//} else {
//    result = 12
//}
//
//
////EXERCISE: Consider the following code:
//
//let tableRows = 50
//let hasTitle = true
//
//if hasTitle {
//    let screenHeight = tableRows + 10
//} else {
//    let screenHeight = tableRows + 20
//}
//
////Can you re-factor the above code to use ternary conditional operator
//
////let screenHeight = hasTitle ? tableRows + 10 : tableRows + 20
//
//let screenHeight = tableRows + (hasTitle ? 10 : 20) //no repitition
//
//
////MARK: Switch statement
//
//let someCharacter: Character = "e"
//switch someCharacter {
//    
//    case "a", "e", "i", "o", "u":
//        println(" \(someCharacter) is a vowel")
//    
//    case "b", "c":
//        println("Some Consonant")
//    
//    default:
//        println("Not a vowel nor a consonant")
//}
//
//
////MARK: Ranges
//
//let count = 3_000_000_000_000
//let countedThings = "stars in the Milky Way"
//
//var naturalCount: String
//
//switch count {
//case 0:
//    naturalCount = "no"
//case 1...3:
//    naturalCount = "a few"
//case 4...9:
//    naturalCount = "several"
////continue
//default:
//    naturalCount = "millions"
//}
//
//
////MARK: Where Clause
//
//let vegetables = "black pepper"
//
//switch vegetables {
//    case "celery":
//        let veggieComment = "add raisins"
//    
//    case "tomatoes", "cucumbers":
//        let veggieComment = "add olives and feta"
//    
//    case let v where v.hasSuffix("pepper"):
//        let veggieComment = "Is \(v) spicy?"
//    
//    default:
//        let veggieComment = "try another veggie"
//}


//EXAMPLE

var score1, score2, score3, scoreAvg: Double

let numOfScores = 3
let highScore = 95.0

score1 = 95.5
score2 = 88.9
score3 = 67.9

scoreAvg = (score1 + score2 + score3) / Double(numOfScores)

var letterGrade: Character = "U"

if scoreAvg < 60 {
    letterGrade = "F"
} else if scoreAvg < 70 {
    letterGrade = "D"
} else if scoreAvg < 80 {
    letterGrade = "C"
} else if scoreAvg < 90 {
    letterGrade = "B"
} else if scoreAvg <= 100 {
    letterGrade = "A"
} else {
    letterGrade = "U"
}

//EXERCISE: Re-factor to use a switch statement

switch scoreAvg {
    case 0...59.9:
        letterGrade = "F"
    case 60...69.9:
        letterGrade = "D"
    case 70...79.9:
        letterGrade = "C"
    case 80...89.9:
        letterGrade = "B"
    case 90...100:
        letterGrade = "A"
    default:
        letterGrade = "U"
    
}


//MARK: Optionals--a way to declare variables that may or may not have a value
//Use nil to set a variable to a no-value state

var optionalMiddleName: String? //use ? for optional--default value is nil
//var optionalMiddleName: String? = "Michelle"

if optionalMiddleName == nil { //check to see if has a value or not
    println("Applicant does not have a middle name")
}


//MARK: Forced Unwrapping--use the !






































