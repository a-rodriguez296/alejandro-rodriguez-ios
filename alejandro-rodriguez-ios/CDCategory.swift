//
//  CDCategory+CoreDataClass.swift
//  RepasoRappi
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import CoreData
import MagicalRecord

@objc(CDCategory)
public class CDCategory: NSManagedObject {

    
    convenience init(name: String, context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: CDCategory.mr_entityName(), in: context)
        self.init(entity: entity!, insertInto: context)
        self.name = name
    }
    
    
}
