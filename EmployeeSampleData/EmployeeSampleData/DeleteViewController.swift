//
//  DeleteViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import  CoreData

class DeleteViewController: UIViewController {

    @IBOutlet weak var userEnteredid: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userEnteredid.becomeFirstResponder()
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
        userEnteredid.text=""
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func deleteButtonClicked(_ sender: Any) {
        let context = managedObjectContext()
        let userEnteredEmpid = Int16((self.userEnteredid.text! as NSString).integerValue)

        let pred = NSPredicate(format: "empId == %d ", userEnteredEmpid)
        
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        request.predicate = pred
        // request.sortDescriptors = [NSSortDescriptor(key: "empId", ascending: true)]
        
        do {
            if (userEnteredid.text?.isEmpty)!
            {
                displayalert(myTitle: "Error", myMessage: "Field Mising")
            }
            else
            {
            let obj = try context.fetch(request)
            
            for item in obj {
                context.delete(item)
                displayalert(myTitle: "Success", myMessage: "Employee Details Deleted")
                print("deleted")
            }
            
            try context.save()
            
        }
        }
        catch {
            self.displayalert(myTitle: "Error", myMessage: "Failed To Delete Employee Details")
        }

        
    }
   
    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

   

}

