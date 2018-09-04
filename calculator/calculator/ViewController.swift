//
//  ViewController.swift
//  calculator
//
//  Created by rakshitha on 21/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    var operatorpressed=false
    var firstNumber:Int=0
    var SecondNumber:Int=0
    var myoperator:String=""
    var unaryplus:Bool=false
    var result:Double=0
    var str:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text=String(0)
    }

   func forClearing()
   {
    firstNumber=0
    SecondNumber=0
    operatorpressed=false
    myoperator=""
    }
    @IBAction func clearButton(_ sender: UIButton)
    {
        
        forClearing()
        label.text=""
        label.text=String(0)
    }
   
    @IBAction func unaryOperator(_ sender: Any) {
        
        if (label.text?.hasPrefix("-"))!
        {
            label.text?.removeFirst()
        }
        else
        {
            label.text = "-" + label.text!
        }
        
        
    }
    
    @IBAction func numbers(_ sender: UIButton)
    {
        
        if operatorpressed{
           
            label.text=String(SecondNumber) + ( sender.currentTitle!)
            SecondNumber=Int(label.text!)!
        }
        else{
            label.text = String(firstNumber) + (sender.currentTitle!)
            firstNumber =  Int(label.text!)!
        }
    
    }
    
    @IBAction func button(_ sender: UIButton)
    {
        print(firstNumber)
        print(SecondNumber)
       label.text=" "
       let Operatorused=sender.currentTitle!
       if Operatorused == "="
       {
        str=String(firstNumber)
        firstNumber=Int(firstNumber)
        
        if str.hasPrefix("-")
        {
            firstNumber  = -firstNumber
        }
        str=String(SecondNumber)
        SecondNumber=Int(SecondNumber)
        if str.hasPrefix("-")
        {
            SecondNumber = -SecondNumber
        }
                switch myoperator
        {
        case "+": result = Double(firstNumber + SecondNumber)
        case "-": result = Double( firstNumber - SecondNumber)
        case "*":result  = Double(firstNumber * SecondNumber)
        case "/":result  = Double(firstNumber / SecondNumber)
       // case "%":result  = firstNumber % SecondNumber
        default:
              result=Double(firstNumber * SecondNumber  )      //??????????????
        }
        label.text=String(stringInterpolation: String(firstNumber)," ",myoperator," ",String(SecondNumber)," ",String(result))
        forClearing()
        }else
       {
        
        myoperator=sender.currentTitle!
        operatorpressed=true
        label.text=myoperator
        }

}
}
