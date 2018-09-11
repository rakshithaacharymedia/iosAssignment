//
//  DisplayDepartmentViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 11/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class DisplayDepartmentViewController: UIViewController {

    
    var depDetails = [Department]()
    override func viewDidLoad() {
        super.viewDidLoad()
        depDetails = DepartmentDataBase.dep.fetchData()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
extension DisplayDepartmentViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return depDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DepTableViewCell
        cell.deplabel .text = depDetails[indexPath.row].depId! + " " + depDetails[indexPath.row].depName!
        return cell
    }
    
    
}
