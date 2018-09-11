//
//  Department+CoreDataProperties.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 07/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var depId: String?
    @NSManaged public var depName: String?
    @NSManaged public var containsMany: NSSet?

}

// MARK: Generated accessors for containsMany
extension Department {

    @objc(addContainsManyObject:)
    @NSManaged public func addToContainsMany(_ value: Employee)

    @objc(removeContainsManyObject:)
    @NSManaged public func removeFromContainsMany(_ value: Employee)

    @objc(addContainsMany:)
    @NSManaged public func addToContainsMany(_ values: NSSet)

    @objc(removeContainsMany:)
    @NSManaged public func removeFromContainsMany(_ values: NSSet)

}
