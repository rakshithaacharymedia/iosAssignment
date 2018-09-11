//
//  SearchforEmpViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import  CoreData

class SearchforEmpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
       
        
    
    @IBOutlet weak var searchById: UISearchBar!
   
    @IBOutlet weak var tableview: UITableView!
   
    var profileArray = [String]()
    var employeeArray=[Employee1]()
    var showdata = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundColor=UIColor.black
      
        tableview.isHidden=true
       searchById.delegate=self
        
        searchBar.showsScopeBar=true
        searchBar.scopeButtonTitles=["Name","Empid"]
        searchBar.selectedScopeButtonIndex=0
    
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
            cell.depLabel.text = employeeArray[indexPath.row].depname
        
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
        
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      //  let text:String?
        search(text: searchText,index:searchBar.selectedScopeButtonIndex)
        
     
        
    }
    
    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func search(text:String,index:Int)
    {
        employeeArray.removeAll()
       
        let context = managedObjectContext()
        var pred:NSPredicate?
        if text != nil{
            
        
        switch index{
       
        case 1:
            pred = NSPredicate(format: " empId == %d ",Int16(text)!)
        default:
            pred = NSPredicate(format: "name contains[c] %@ ",text)

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
                    employeeArray.append(Employee1(id:Int(item.empId),name:item.name!,address:item.address!,salary:Int(item.salary),depName:(item.worksFor?.depName!)!))
                    
                }
                self.tableview.reloadData()
                self.tableview.isHidden=false
                
            }
          
            
        }
            
            
        catch {
            displayalert(myTitle: "Error", myMessage: "Failed To Search")
            
        }
    }
}





