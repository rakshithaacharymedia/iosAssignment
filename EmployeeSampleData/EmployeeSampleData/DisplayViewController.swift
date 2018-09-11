//
//  DisplayViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import  CoreData

class DisplayViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var profileArray = [String]()
    var showdata = false
    
    var id:Int?
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundColor=UIColor.black
        tableview.isHidden=true
        fetch()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "displaycell", for: indexPath) as! DisplayTableViewCell
        
        cell.idlabel.text=profileArray[0]
        cell.namelabel.text=profileArray[1]
        cell.addresslabel.text=profileArray[2]
        cell.salarylabel.text=profileArray[3]
       cell.depLabel.text = profileArray[4]
       cell.backgroundColor=UIColor.black
//        cell.layer.borderWidth = 2
//        cell.layer.cornerRadius = 8
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
    func fetch(){
        
        print("inside fetch")
        let context = managedObjectContext()
        print(id ?? "no")
        let pred = NSPredicate(format: "empId == %d ",id! )
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        request.predicate = pred
     do {
        profileArray.removeAll()
        let obj = try context.fetch(request)
             print("printing the obj",obj)
            profileArray.append(String(obj[0].empId))
           profileArray.append(obj[0].name!)
            profileArray.append(obj[0].address!)
            profileArray.append(String(obj[0].salary))
          profileArray.append((obj[0].worksFor?.depName)!)
            print(profileArray)
            tableview.isHidden=false
            tableview.reloadData()
    
            showdata=true
    
    
    }
    
    catch {
    
    }
    
}
func managedObjectContext() -> NSManagedObjectContext {
    return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
}


