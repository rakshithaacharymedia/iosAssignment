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
    var showdata=false
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var mytable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundColor=UIColor.black
        tableview.isHidden=true
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
      vc.selectedempName=empname[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
        
    }
   
    @IBAction func addButtonClicked(_ sender: Any) {
        let vc=storyboard?.instantiateViewController(withIdentifier:"AddViewController" ) as! AddViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
   
    @IBAction func fetchButtonClicked(_ sender: Any) {
        let context = managedObjectContext()
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
      
        do {
            var obj = try context.fetch(request)
            print(obj.count)
            for emp in obj {
                empname.append(emp.name!)
                tableview.isHidden=false
                showdata=true
                tableview.reloadData()
                }
         obj.removeAll()
            
        }
        catch {
            
        }
        
    }

    
    
    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

}


