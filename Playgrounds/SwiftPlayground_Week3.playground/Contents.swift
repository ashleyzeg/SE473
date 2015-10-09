//Playground Week 3 - Swift Syntax: Clases, Enumarations

import UIKit

//Classes and Objects

//class Counter {
//    
//    //variables are called properties
//    var count: Int = 0 //all properties need to be initialized
//    
//    //initializer (similar to a constructor)
//    init(count: Int) {
//        //keyword self used to refer to the property name rather than the parameter name
//        self.count = count
//    }
//    
//    //funcitons inside a class are calle dmethods
//    func incrementBy(amount: Int, numberOfTimes: Int) {
//        count += amount * numberOfTimes
//    }
//}
//
////instantiate an object of Counter
//var myCounter = Counter(count: 1)
////when methods are called we need to give  paramater names except the first parameter
//myCounter.incrementBy(2, numberOfTimes: 3)
//println("The count is \(myCounter.count)")


//Overloading of init()
//
//class Color {
//    
//    var red, green, blue: Double
//    
//    init(newRed: Double, green: Double, blue: Double) {
//        self.green = green
//        self.blue = blue
//        red = newRed
//    }
//    
//    init(gray: Double) {
//        red = gray
//        green = gray
//        blue = gray
//    }
//}
//
////create some Color Objects
//let magenta = Color(newRed: 1.0, green: 0.0, blue: 1.0)
//let halfGray = Color(gray: 0.5)
//
//
////Optional Properties
//class SurveyQuestion {
//    
//    var text: String
//    var response: String?
//    
//    init(text: String) {
//        self.text = text
//    }
//    
//    func ask() {
//        println(text)
//    }
//    
//}
//
//var cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
//cheeseQuestion.ask()
//cheeseQuestion.response
//
//cheeseQuestion.response = "No I don't like cheese"
//cheeseQuestion.response
//
//
////Array of objects
//class Person {
//    
//    var firstName: String = ""
//    var lastName: String = ""
//    var age: Int
//    var homeTown: String! //instead of = ""
//    var address: String!
//    var phone: String!
//    var email: String!
//    
//    init(age: Int, homeTown: String?) {
//        self.age = age
//        self.homeTown = homeTown
//    }
//    
//    init(first: String, last: String, age: Int, homeTown: String?, address: String?, phone: String?, email: String?) {
//        
//        firstName = first
//        lastName = last
//        self.age = age
//        self.homeTown = homeTown
//        self.address = address
//        self.phone = phone
//        self.email = email
//        
//    }
//    
//    func fullName() -> String {
//        return firstName + " " + lastName
//    }
//    
//    func description() {
//        println(fullName())
//        println("Age: \(age)")
//        println("Hometown: \(homeTown)")
//    }
//}
//
//var jon = Person(age: 34, homeTown: nil)
//jon.description()
//
//func getSmiths() -> [Person] {
//    var jacob = Person(age: 23, homeTown: "Indy")
//    var ashley = Person(age: 22, homeTown: "Nashville")
//    var brot = Person(age: 19, homeTown: nil)
//    
//    return [jacob, ashley, brot]
//}
//
//var smithFamily = getSmiths()
//smithFamily.count
//smithFamily[0].description
//
//for p in smithFamily {
//    //smithFamily[p]
//}

//Inheritance 
class Vehicle {
    
    var numberOfWheels: Int
    
    init(wheels: Int) {
        numberOfWheels = wheels
    }
    
    //computed property
    var desc: String {
        return "\(numberOfWheels)"
    }
}

var myVehicle = Vehicle(wheels: 4)
myVehicle.desc


//Inheritance Syntax  class: parent class
class Bicycle: Vehicle {
    
    init() {
        super.init(wheels: 1) //initialize parent class
        numberOfWheels += 1
    }
}

var myBike = Bicycle()
myBike.desc


//Getters and Setters

class NamedShape {
    
    var numberOfSides: Int = 0
    var shapeName: String
    
    init(name: String, sides: Int) {
        shapeName = name
        numberOfSides = sides
    }
    
    func simpleDesc() -> String {
        return "A \(shapeName) with \(numberOfSides) sides"
    }
}

class Square: NamedShape {
    
    var sideLength: Double
    
    init(length: Double, name: String) {
        sideLength = length
        super.init(name: name, sides: 4)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    //override the super class implementation 
    override func simpleDesc() -> String {
        return "A \(shapeName) with sides of length \(sideLength)"
    }
}

let testShape = Square(length: 5.5, name: "test square")
testShape.area()
testShape.simpleDesc()


class equilateraTriangle: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name, sides: 3)
        numberOfSides = 3
    }
    
    //use of getter and setter
    var perimeter: Double {
        get {
            return 3 * sideLength
        }
        set {
            //typical authorization process goes here
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDesc() -> String {
        return "An Equuilateral Triangle with sides of length \(sideLength)"
    }
}

var myTriangle = equilateraTriangle(sideLength: 1.3, name: "equilateral triangle")
myTriangle.simpleDesc()
myTriangle.perimeter //calls the get()
myTriangle.perimeter = 9.9 //calls the set()
myTriangle.sideLength

//Property Observers

class StepCounter {
    var totalSteps: Int = 0 {
        //is called just before the value is stored
        willSet(newTotalSteps) {
            println("About to set totalSteps to \(newTotalSteps)")
        }
        //is called immediately after the value is set
        didSet {
            if totalSteps > oldValue {
                println("Added \(totalSteps) steps")
            }
        }
    }
}

let myStepCounter = StepCounter()
myStepCounter.totalSteps = 200
myStepCounter.totalSteps = 360
myStepCounter.totalSteps = 800
myStepCounter.totalSteps = 100

println("Total steps = \(myStepCounter.totalSteps)")












