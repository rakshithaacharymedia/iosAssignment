//
//  DepartmentDatabase.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 11/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import Foundation
import CoreData
import UIKit



class DepartmentDataBase
{
    
    static let dep = DepartmentDataBase()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func add(object:[String:String])
    {
      let department = NSEntityDescription.insertNewObject(forEntityName: "Department", into: context) as! Department
        department.depId = object["id"]
         department.depName = object [ "name" ]
      do
      {
        try context.save()
        print("success")
      
    }
        catch
        {
            print("failed to add to department")
        }
}

    func getid(depname:String)-> Department
    {
        var result = [Department]()
        let request = NSFetchRequest<Department>(entityName: "Department")
        let prdiacte=NSPredicate(format:"depName == %@",depname)
        request.predicate=prdiacte
        do
        {
            result = try context.fetch(request)
           

        }
        catch{
            print("error")
          
        }
        return result[0]
    }
    
    
    func fetchData () -> [Department]
    {
        var result = [Department]()
        let request = NSFetchRequest<Department>(entityName: "Department")
       
        
        do
        {
            result = try context.fetch(request)
            print("IM HERE",result)
            
        }
        catch{
            print("error")
            
        }
       return result
    }
}

