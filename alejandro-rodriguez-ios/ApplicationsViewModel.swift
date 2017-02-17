//
//  ApplicationsViewModel.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import MagicalRecord

class ApplicationsViewModel: NSObject {
    
    
    let category:CDCategory
    
    lazy var fetchedResultsController:NSFetchedResultsController<CDApplication> = {
        
        
        let applicationsFetchedRequest = NSFetchRequest<CDApplication>(entityName: CDApplication.mr_entityName())
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let predicate = NSPredicate(format: "%K = %@", "category", self.category)
        applicationsFetchedRequest.predicate = predicate
        applicationsFetchedRequest.sortDescriptors = [sortDescriptor]
        
        
        let frc = NSFetchedResultsController(fetchRequest: applicationsFetchedRequest, managedObjectContext: NSManagedObjectContext.mr_default(), sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        return frc
    }()
    
    init(category: CDCategory) {
        self.category = category
    }
    
    
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

extension ApplicationsViewModel: NSFetchedResultsControllerDelegate{}
