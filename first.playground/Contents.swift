//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport

class person{
    
    private var _email:String;
    private var _password:String;
    var name:String;
    var age:Int;
    
    init(email:String,password:String,name:String,age:Int)
    {
        self._email=email;
        self._password=password;
        self.name=name;
        self.age=age;
    }
    private func loginDetails(){
        
        print("The email is \(self._email)")
        print("The password is \(self._password)")
        
    }
     func display()
    {
        print("Displaying login details")
        loginDetails()
    }
    
    private func userInfo(){
        
        print("Name is \(self.name)")
        print("Age is \(self.age)")
        
        
        
    }
    func displayUser()
    {
        print("Displaying user information")
        userInfo()
    }
    
    func displayGreeting(){
        print("Details are")
    }
    
}
class indian:person
{
    var stateLiving:String!
    
    
    init(emails:String,passwords:String,names:String,ages:Int,stateLiving:String) {
        super.init(email:emails, password:passwords,name:names,age:ages)
        self.stateLiving=stateLiving;
    }
    
   override func displayGreeting() {
        print("Welcome")
    }
}
let s1 = indian(emails:"abc",passwords:"r1234",names:"rakshitha",ages:25,stateLiving:"Karnataka");

s1.displayGreeting()
s1.displayUser()
s1.display()
print(s1.name)

