//
//  CDCategory+CoreDataProperties.swift
//  RepasoRappi
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import CoreData


extension CDCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategory> {
        return NSFetchRequest<CDCategory>(entityName: "CDCategory");
    }

    @NSManaged public var name: String?
    @NSManaged public var applications: NSSet?

}

// MARK: Generated accessors for applications
extension CDCategory {

    @objc(addApplicationsObject:)
    @NSManaged public func addToApplications(_ value: CDApplication)

    @objc(removeApplicationsObject:)
    @NSManaged public func removeFromApplications(_ value: CDApplication)

    @objc(addApplications:)
    @NSManaged public func addToApplications(_ values: NSSet)

    @objc(removeApplications:)
    @NSManaged public func removeFromApplications(_ values: NSSet)

}
