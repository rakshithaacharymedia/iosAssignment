//
//  ViewController.swift
//  uiAssignment
//
//  Created by rakshitha on 27/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

//protocol display {
//    func displayalert(myTitle:String,myMessage:String)
//}
class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var viewDetails: UITextView!
    @IBOutlet weak var userMobilenumber: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var IM: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     self.userName.becomeFirstResponder()
        //IM.image=#imageLiteral(resourceName: "FB")
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
    }
    @IBAction func buttonClicked(_ sender: Any) {
        if (userName.text?.isEmpty)!
        {
            displayalert(myTitle: "Error", myMessage: "Name cannot be empty")
            
        }
       else if (userMobilenumber.text?.count != 10 || (userMobilenumber.text?.isEmpty)!)
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


