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
            
            //Create Core Data objects. FYI these objects are saved when the autoSave() function is called in the class AppDelegate
            let cdCategory = CDCategory(name: category, context: NSManagedObjectContext.mr_default())
            
            let filteredApplications = applications.filter({ (application: Application) -> Bool in
                return application.category == category
            })
            
            for application in filteredApplications{
                
                //Assign to cdCategory its corresponding applications
                let _ = CDApplication(application: application, category: cdCategory, context: NSManagedObjectContext.mr_default())
            }
        }
    }
    
    
    class func isDataAvailable() -> Bool{
        
        //Determine if there's data available
        guard let _ = CDCategory.mr_findFirst() else{
            return false
        }
        
        return true
    }
  
    
    class func deleteCurrentData(){
        
        //Delete current data. Since there is a cascade rule, if we delete the categories, the applications and the photos are also deleted.
        CDCategory.mr_truncateAll()
    }
    
    
    class func getFirstCategory() ->CDCategory{
        
        let firstCategory = CDCategory.mr_findFirst(with: nil, sortedBy: "name", ascending: true)
        return firstCategory!
    }
    
    
    
}

