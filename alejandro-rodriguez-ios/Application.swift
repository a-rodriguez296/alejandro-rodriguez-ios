//
//  Application.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Application {
    
    
    let category:String
    let appName:String
    let thumbnailURL:String
    let summary:String
    
    init(json: JSON) {
        
        
        category = json[Constants.Endpoints.TopApplications.category][Constants.Endpoints.TopApplications.attributes][Constants.Endpoints.TopApplications.label].stringValue
        appName =  json[Constants.Endpoints.TopApplications.imName][Constants.Endpoints.TopApplications.label].stringValue
        thumbnailURL = json[Constants.Endpoints.TopApplications.imImage].arrayValue[1][Constants.Endpoints.TopApplications.label].stringValue
        summary = json[Constants.Endpoints.TopApplications.summary][Constants.Endpoints.TopApplications.label].stringValue
    }
    
    
}

