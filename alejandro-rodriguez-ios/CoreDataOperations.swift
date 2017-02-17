//
//  CoreDataOperations.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import MagicalRecord

class CoreDataOperations {
    
    
    class func saveCategoriesAndApplications(with applicationsResponse: ApplicationsResponse){
        
        
        let categories = applicationsResponse.categoriesArray
        let applications = applicationsResponse.applicationsArray
        
        //Iterate over categories and save the applications associated to each of them.
        for category in categories{
            
            let filteredApplications = applications.filter({ (application: Application) -> Bool in
                return application.category == category
            })
            
            for application in filteredApplications{
                
                
                let cdCategory = CDCategory(name: category, context: NSManagedObjectContext.mr_default())
                
                let _ = CDApplication(application: application, category: cdCategory, context: NSManagedObjectContext.mr_default())
            }
            
            
        }
        
    }
  
    
    
    
}

