//
//  DisplayDepartmentViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 11/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import Foundation


class DisplayDepartmentViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var details1 = [Int16:String]()
    var details2 = [Int16:String]()
    var depDetails = [Department]()
    var depSelected = false
    
    struct  cellData {
        var opened = Bool()
        var title = String()
        var sectionData = [String]()
        
    }
    var tableviewData = [cellData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        depDetails = DepartmentDataBase.dep.fetchData()
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        // get and set section data
        details1 = DepartmentDataBase.dep.getcount(name:"ios")
        details2 = DepartmentDataBase.dep.getcount(name:"android")
        
        tableviewData = [cellData(opened :false,title:"IOS",sectionData:Array(details1.values)),
                         cellData(opened :false,title:"ANDROID",sectionData:Array(details2.values))]
    }
}
extension DisplayDepartmentViewController:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableviewData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableviewData[section].opened == true{
            return tableviewData[section].sectionData.count + 1
        }else
        {
            return 1
        }
    }
 

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DepTableViewCell else { return UITableViewCell()}
            cell.textLabel?.text=tableviewData[indexPath.section].title
            cell.backgroundColor = UIColor.green
            cell.textLabel?.textColor = UIColor.purple
            cell.layer.borderWidth = 2
            return cell
        
        }else
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? DepTableViewCell  else {return UITableViewCell()}
            cell.textLabel?.text = tableviewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
      
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        var id :Int?
        if tableviewData[indexPath.section].opened == true
        {
            tableviewData [indexPath.section].opened = false
            print(tableviewData[indexPath.section].sectionData)
            let sections = IndexSet.init(integer:indexPath.section)
            tableView.reloadSections(sections, with:.top)
            
           
            if indexPath.row > 0
            {
                let selectedName = tableviewData[indexPath.section].sectionData[indexPath.row - 1]
                print("Selected name is ",selectedName)
            switch indexPath.section
            {
            case 0:
                id  = findKey(value: selectedName, dict: details1)
            case 1:
                id  = findKey(value: selectedName, dict: details2)
            default: break


            }
            
            let vc=storyboard?.instantiateViewController(withIdentifier: "DisplayViewController") as! DisplayViewController
                print("printing id ",id ?? 0)
            vc.id = id
            print(indexPath.row)
            //vc.id = Array(employeeDetails)[indexPath.row].value
            navigationController?.pushViewController(vc, animated: true)
        }
        }
        else
        {
            tableviewData [indexPath.section].opened = true
            let sections = IndexSet.init(integer:indexPath.section)
            tableView.reloadSections(sections, with: .bottom)
            
        }
    
}
    
    func findKey(value:String,dict:[Int16:String])->Int
    {
        var key :Int?
       for (k,v) in dict
        {
            if v == value
            {
               key = Int( k)
                break
            }
        }
        return key!
    }
  
}


