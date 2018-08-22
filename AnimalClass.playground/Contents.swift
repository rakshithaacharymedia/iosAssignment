//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

struct Name{
    var species:String=" "
    var family:String=" "
    var arraysoffamily:[String] = []
    mutating func setProperties(family:String)
    {
        arraysoffamily.append(family)
        
    }
    func printFamilydetails()
    {
        print("The familys are")
        print(arraysoffamily)
    }
}
class Animal {
    lazy var name=Name()
    var year:Int{
        get{
            return 2018
        }
        set{
            print("Lifespan is",year-newValue)
        }
    }
    var celsius: Float = 0.0
    var fahrenheit: Float {
        get {
            return (celsius * 1.8) + 32.0
        }
        set {
            celsius = (newValue - 32)/1.8
            print("Temperature in fahrenheit is  ",newValue," and in celsius is  ",celsius)
        }
    }
    var cellShape:String="Flat"
    static var noOfeyes=2
    static var isTail=true
    final var color="brown"
    static func properties ()
    {
        print("No of eyes is ",noOfeyes)
    }
    func displayCellshape()
    {
        print("Cell shape of animals is flat",cellShape)
        print("The color is ",color)
    }
    class  func isTailspresent()
    {
        print(isTail)
    }
    
    final func display()
    {
        print("Displaying information")
    }
}
final class Vertebrates:Animal {
    var backboneDensity:Int = 0{
        willSet{
            print("the new value of backbonedensity is =  ",newValue)
        }
        didSet{
            print("The old value of backbonedensity is = ",oldValue)
        }
    }
    var backboneWeight:Double=0
    init(backboneDensity:Int,backboneWeight:Double)
    {
        self.backboneDensity=backboneDensity
        self.backboneWeight=backboneWeight
    }
    
}
final class Invertebrates:Animal{
    var visible:Bool=false
    override var year:Int{
        get{
            return 2016
        }
        set{
            print("Lifespan is",year-newValue)
        }
    }
    override func displayCellshape() {
        print("Cell shape of invertebrates is",cellShape)
    }
    func isVisible(){
        print("The visibility of invertebrate is ",visible)
    }
    override class func isTailspresent () {
        print("Is tail present ",false)
    }
    
}

var human=Vertebrates (backboneDensity:50,backboneWeight:50.3655)
human.display()
human.backboneDensity=45
human.year=1996
human.fahrenheit=55
human.name.setProperties(family: "homo")
human.name.setProperties(family:"sapiens")
human.name.printFamilydetails()
human.color="yellow"
print(human.color)
Vertebrates.properties()


print("/////////////////////")
var amoeba=Invertebrates()
amoeba.display()
amoeba.cellShape="irregular"
amoeba .year=1996
amoeba.displayCellshape()
Invertebrates.noOfeyes=1
Invertebrates.properties()
Invertebrates.isTailspresent()
amoeba.isVisible()
amoeba.name.setProperties(family: "uvw")
amoeba.name.setProperties(family:"xyz")
amoeba.name.printFamilydetails()

