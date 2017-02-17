//
//  CDPhoto+CoreDataClass.swift
//  RepasoRappi
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import MagicalRecord

@objc(CDPhoto)
public class CDPhoto: NSManagedObject {

    convenience init(image: UIImage, context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: CDPhoto.mr_entityName(), in: context)
        self.init(entity: entity!, insertInto: context)
        photoData = UIImageJPEGRepresentation(image, 1.0)
    }
    
    func image() -> UIImage{
        return UIImage(data: photoData!)!
    }
    
}
