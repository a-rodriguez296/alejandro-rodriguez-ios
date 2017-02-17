//
//  CategoriesViewModel.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import MagicalRecord

class CategoriesViewModel: NSObject{
    
    
    //Initialize the NSFetchedResultsController
    
    lazy var fetchedResultsController:NSFetchedResultsController<CDCategory> = {
        
        
        let categoriesFetchedRequest = NSFetchRequest<CDCategory>(entityName: CDCategory.mr_entityName())
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        categoriesFetchedRequest.sortDescriptors = [sortDescriptor]
        
        
        let frc = NSFetchedResultsController(fetchRequest: categoriesFetchedRequest, managedObjectContext: NSManagedObjectContext.mr_default(), sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        return frc
    }()
    
   
    
    func initializeFetchedResultsController(){
        do {
            try fetchedResultsController.performFetch()
            
        }
        catch {
            print("An error occurred")
        }
    }

    
    func numberOfRowsIn(section: Int) -> Int{
        
        guard let sections = fetchedResultsController.sections else{
            return 0
        }
        let currentSection = sections[section]
        return currentSection.numberOfObjects
    }
    
    
    func object(at indexPath: IndexPath) -> NSManagedObject{
        return fetchedResultsController.object(at: indexPath)
        
    }
    
}

extension CategoriesViewModel: NSFetchedResultsControllerDelegate{}
