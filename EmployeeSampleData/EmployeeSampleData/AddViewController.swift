//
//  AddViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var empsalary: UITextField!
    @IBOutlet weak var empaddress: UITextField!
    @IBOutlet weak var empname: UITextField!
    @IBOutlet weak var empid: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.empid.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayalert(myTitle:String,myMessage:String)
    {
        
        let alert = UIAlertController(title:myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print(myTitle)
        empaddress.text=""
        empsalary.text=""
        empid.text=""
        empname.text=""
    }


    @IBAction func insertButtonClicked(_ sender: Any) {
        let context = managedObjectContext()
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        entity.name = empname.text
        entity.empId = Int16((self.empid.text! as NSString).integerValue)
        entity.salary = Int16((empsalary.text! as NSString).integerValue)
        entity.address = empaddress.text
        do {
            if (empname.text?.isEmpty)! || empid.text?.count==0 || empsalary.text?.count==0 || (empaddress.text?.isEmpty)!{
                displayalert(myTitle: "Error", myMessage: "Fields Missing")
            }
            
            else
            {
              try context.save()
            //print("added")
                displayalert(myTitle: "Success", myMessage: "User Registered")
        }
   }
        catch  {
            self.displayalert(myTitle: "Error", myMessage: "Couldnot Insert")
        }
    }

    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    }



