//
//  Employee+CoreDataProperties.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 07/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var address: String?
    @NSManaged public var empId: Int16
    @NSManaged public var name: String?
    @NSManaged public var salary: Int16
    @NSManaged public var worksFor: Department?

}
