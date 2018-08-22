//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport



var arrays=[1,2,3,4,5]

print(arrays.sorted(by:>))
//var newarray=arrays.map{$0*10}
//print(newarray)*/

var dict=["one":1,"two":2,"three":3]
var newdict=dict.map{(key,_) in key.hasPrefix("on")}
var dicts={}
let keys=dict.values.sorted(by:>)
print(newdict)

dict.removeValue(forKey: "one")
print(dict)

var dict2:[AnyHashable:Any]=["five":5,"six":6,7:"Seven"]
print(dict2)
dict2.updateValue(55, forKey:"five")
print(dict2)
/*var newarray2=arrays.filter{$0>2}
print(newarray2)


dict.filter{(key,value)->Bool in value>2}
//print(arrays.reduce(0){$0+$})


print(dict.reduce("Number are ") {$0 + $1.key})


for i in arrays.enumerated()
{
    print(i)
}
for i in dict.enumerated()
{
    print(i)
}
*/


/*let currentdate=Date()

let date=Date.init(timeIntervalSinceNow: 120)

let dateformatter=DateFormatter()
//dateformatter.dateStyle = .full
//dateformatter.timeStyle = .full
dateformatter.dateFormat="hh:mm MMMM:dd"
let datestring=dateformatter.string(from: currentdate)
print(datestring)


/*var s="2014/02/25"
let dateformatter=dateformatter()
dateformatter.dateFormat="yyyy/dd/MM"
dateformatter.date(from:s)*/


if currentdate < date
{
    print("great")
}


let calendar=Calendar.current*/



/*let locale=Locale.current
print(locale.regionCode!)
print(locale.languageCode!)

let dateCurrent = Date()

let calendar = Calendar.current

let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year,Calendar.Component.minute], from: dateCurrent)

print("Day:\(components.day!) Month:\(components.month!) Year:\(components.year!)")

print(components.minute!)



let calendars = Calendar.current

var componentss = DateComponents()

componentss.day = 25
componentss.month = 1
componentss.year = 2011
componentss.hour = 2
componentss.minute = 15

let newDate = calendar.date(from: componentss)

let dateformatter=DateFormatter()

dateformatter.dateFormat = "HH:mm dd/MM/yyyy"

print(dateformatter.string(from: newDate!))*/




let stringNumber: String? = "5"
let intNumber = stringNumber.map { $0 + " Hello world" }
print(intNumber!)


var sets:Set=[1,2,3,4,5,6,55]
let sets1:Set=[1,2,3,4,5,6,36,101]
print(sets.union(sets1))
print(sets.intersection(sets1))
print(sets.symmetricDifference(sets1))
print(sets.subtracting(sets1))
sets.insert(100)
print(sets)
sets.remove(100)
sets.contains(5558)

sets.sorted(by:<)

print(sets.map{ $0+20})
print(sets.filter{ $0>=5})
print(sets.reduce(1){$0 + $1})
print(sets.reduce(1,+))


let arrayss=["abc","defffd","hig"]
let dict22 = Dictionary(grouping:arrayss) {$0.last!}
print(dict22)


let newarray=[1,2,3,4,5,5]
var s=(newarray.filter{$0 % 2==1})
print(s.count)


newarray.forEach{
    
    print("the number is",$0)
}
print(newarray.first {$0 > 3}!)

