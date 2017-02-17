//
//  CDApplication+CoreDataClass.swift
//  RepasoRappi
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import CoreData

@objc(CDApplication)
public class CDApplication: NSManagedObject {

    convenience init(application: Application, category: CDCategory, context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: CDApplication.mr_entityName(), in: context)
        self.init(entity: entity!, insertInto: context)
        self.name = application.appName
        self.category = category
        self.summary = application.summary
        self.thumbnailURL = application.thumbnailURL
    }
    
}
