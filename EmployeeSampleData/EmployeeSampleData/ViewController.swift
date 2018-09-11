//
//  ViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    var empname:Array<String>=[]
    var empid:Array<Int>=[]
    var employeeDetails=[String : Int]()
    var showdata=false
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var mytable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("f")
//        let dict1 = ["id":"1","name":"ios"]
//        DepartmentDataBase.dep.add(object: dict1)
//        let dict2 = ["id": "2","name":"android"]
//       DepartmentDataBase.dep.add(object: dict2)
        tableview.backgroundColor=UIColor.black
        tableview.isHidden=true
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadTableView()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        tableview.isHidden=true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return empname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell=tableView.dequeueReusableCell(withIdentifier: "viewcell", for: indexPath) as! ViewControllerTableViewCell
        cell.mylabel?.text=empname[indexPath.row]
        
        
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

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let vc=storyboard?.instantiateViewController(withIdentifier: "DisplayViewController") as! DisplayViewController
        vc.id = empid[indexPath.row]
        print(indexPath.row)
        //vc.id = Array(employeeDetails)[indexPath.row].value
        navigationController?.pushViewController(vc, animated: true)
        
    }
   
    @IBAction func addButtonClicked(_ sender: Any) {
        let vc=storyboard?.instantiateViewController(withIdentifier:"AddViewController" ) as! AddViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
   

    func reloadTableView()
    {
        empid.removeAll()
        empname.removeAll()
        let context = managedObjectContext()
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            var obj = try context.fetch(request)
            print(obj.count)
            for emp in obj {
                empname.append(emp.name!)
                self.empid.append(Int(emp.empId))
                employeeDetails=[emp.name! : Int(emp.empId)]
                tableview.isHidden=false
                showdata=true
                tableview.reloadData()
            }
            print(self.empid)
            print(employeeDetails)
//            print(Array(employeeDetails)[0].value)
            obj.removeAll()
            
        }
        catch {
            
        }
    }

    
    
    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

}

//class ViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        tablev
//    }
//    
//}

