//
//  SearchforEmpViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import  CoreData

class SearchforEmpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var userEnteredid: UITextField!
    var profileArray = [String]()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "searchcell", for: indexPath) as! SearchDisplayTableViewCell
        if profileArray.count != 0
        {
            cell.idlabel.text=profileArray[0]
            cell.namelabel.text=profileArray[1]
            cell.addresslabel.text=profileArray[2]
            cell.salarylabel.text=profileArray[3]
        }
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
    func displayalert(myTitle:String,myMessage:String)
    {
        
        let alert = UIAlertController(title:myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print(myTitle)
        userEnteredid.text=""
    }

    @IBAction func searchButtonClicked(_ sender: Any) {
        let context = managedObjectContext()
        let userEnteredEmpid = Int16((self.userEnteredid.text! as NSString).integerValue)
        let pred = NSPredicate(format: "empId == %d ", userEnteredEmpid)
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        request.predicate = pred
        do {
            if (userEnteredid.text?.isEmpty)!
            {
                displayalert(myTitle: "Error", myMessage: "Field Mising")
            }else{
            let obj = try context.fetch(request)
            if obj.count != 0
           {
            profileArray.append(String(obj[0].empId))
            profileArray.append(obj[0].name!)
            profileArray.append(obj[0].address!)
            profileArray.append(String(obj[0].salary))
            print(profileArray)
            tableview.isHidden=false
            tableview.reloadData()
            showdata=true
        }
            else
           {
            displayalert(myTitle: "Alert", myMessage: "Please Register")
            }
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
        
        
    
    

