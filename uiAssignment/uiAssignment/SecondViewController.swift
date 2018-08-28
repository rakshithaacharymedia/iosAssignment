//
//  SecondViewController.swift
//  uiAssignment
//
//  Created by rakshitha on 27/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    
   
    
    @IBOutlet weak var agelabel: UILabel!
    @IBOutlet weak var userNumber: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.userName.becomeFirstResponder()        // Do any additional setup after loading the view.
    }
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
  @IBAction func ageslider(_ sender: UISlider) {
        agelabel.text=String(Int(sender.value))
   }
    @IBAction func buttonClicked(_ sender: Any) {
        if (userName.text?.isEmpty)!
        {
            displayalert(myTitle: "Error", myMessage: "Name cannot be empty")
            print("hello")
        }
        else if (userNumber.text?.count != 10 || (userNumber.text?.isEmpty)!)
        {
           displayalert(myTitle: "Error", myMessage: "Enter valid number")
            
        }
        else
        {
           displayalert(myTitle: "Success", myMessage: "User regitered")
        }
    }
    func displayalert(myTitle:String,myMessage:String)
    {
        
        let alert = UIAlertController(title:myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print(myTitle)
    }
    
}
