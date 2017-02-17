//
//  CDApplication+CoreDataProperties.swift
//  RepasoRappi
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import CoreData


extension CDApplication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDApplication> {
        return NSFetchRequest<CDApplication>(entityName: "CDApplication");
    }

    @NSManaged public var name: String?
    @NSManaged public var summary: String?
    @NSManaged public var thumbnailURL: String?
    @NSManaged public var category: CDCategory?
    @NSManaged public var photo: CDPhoto?

}
