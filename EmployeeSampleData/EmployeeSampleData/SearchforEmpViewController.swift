//
//  SearchforEmpViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import  CoreData

class SearchforEmpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{

    @IBOutlet weak var userEnteredName: UITextField!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var userEnteredid: UITextField!
    var profileArray = [String]()
    var employeeArray=[Employee1]()
    var showdata = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundColor=UIColor.black
        self.userEnteredid.becomeFirstResponder()
        tableview.isHidden=true
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "searchcell", for: indexPath) as! SearchDisplayTableViewCell
       
    
            cell.idlabel.text=String(employeeArray[indexPath.row].id)
            cell.namelabel.text=employeeArray[indexPath.row].name
            cell.addresslabel.text=employeeArray[indexPath.row].address
            cell.salarylabel.text=String(employeeArray[indexPath.row].salary)
        
        cell.backgroundColor=UIColor.black
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view=UIView()
        if showdata{
            let label = UILabel()
            label.text = "Employee Details"
            label.backgroundColor =  UIColor.green
            label.textColor=UIColor.red
            label.textAlignment = .center
            view.addSubview(label)
            return label
        }
        return view
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
       // print("Im here")
        tableview.isHidden=true
    }

    func displayalert(myTitle:String,myMessage:String)
    {
        
        let alert = UIAlertController(title:myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print(myTitle)
        userEnteredid.text=""
    }

    @IBAction func searchButtonClicked(_ sender: Any) {
        employeeArray.removeAll()
        var id:Int16?
        id=Int16((self.userEnteredid.text! as NSString).integerValue)
        var userName:String?
        userName=userEnteredName.text
        let context = managedObjectContext()
        var pred:NSPredicate?
        
        if id != 0, let idforpredicate = id {
            pred = NSPredicate(format: "empId == %d ", idforpredicate)
            print(idforpredicate)
        } else {
             if let nameforpredicate = userName
            {
               pred = NSPredicate(format: "name == %@ ", nameforpredicate)
                print(nameforpredicate)
            }
            else
            {
                displayalert(myTitle: "Error", myMessage: "Field Mising")
            }
        }
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        request.predicate = pred
        do {
                
                let obj = try context.fetch(request)
             if obj.count != 0
                {
                for item in obj
                {
                    employeeArray.append(Employee1(id:Int(item.empId),name:item.name!,address:item.address!,salary:Int(item.salary)))
                   
                }
                
                 self.tableview.isHidden=false
                 self.tableview.reloadData()
                 self.showdata=true
            }
            else
                {
                    displayalert(myTitle: "Failed", myMessage: "No Details Found")
            }
          
        }
       
    
        catch {
            displayalert(myTitle: "Error", myMessage: "Failed To Search")
            
        }
    }
    
    
    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
        
        
    
    

