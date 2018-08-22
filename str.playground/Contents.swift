import UIKit
import PlaygroundSupport

struct book{
    var name="hello"
    var page=500
}

let b=book()

print("name of the book \(b.name)")
print("no of pages\(b.page)")


struct student{
    var name:String
    var age:Int
    var std:Int
    
    
    init(name:String,age:Int)
    {
        self.name=name
        self.age=age
        self.std=50
    }
    
    func display(){
        print("name is \(self.name) and age is\(self.age) and std is \(self.std)")
    }
}

print("enter")
let names = readLine()

    

var s1=student(name:"abc",age:5)

var s2=student(name:"abc",age:56)
s1.display()
s2.display()
