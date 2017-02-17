//
//  ApplicationsRespnse.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import SwiftyJSON
import MagicalRecord

struct ApplicationsResponse{
    
    
    let applicationsArray:Array<Application>
    
    init(json: JSON) {
        
        
        var responseArray = Array<Application>()
        
        for applicationJSON in json[Constants.Endpoints.TopApplications.feed][Constants.Endpoints.TopApplications.entry].arrayValue{
            
            let auxApplication = Application(json: applicationJSON)
            responseArray.append(auxApplication)
            
        }
        
        applicationsArray = responseArray
        
    }
}
