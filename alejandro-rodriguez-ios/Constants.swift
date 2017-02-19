//
//  Constants.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation


struct Constants {
    
    struct Endpoints {
        struct BaseURL {
            static let baseURL = "https://itunes.apple.com/us/rss/"
        }
        
        struct TopApplications {
            static let topApplications = "topfreeapplications/limit=20/json"
            
            static let feed = "feed"
            static let entry = "entry"
            static let category = "category"
            static let label = "label"
            static let imName = "im:name"
            static let imImage = "im:image"
            static let summary = "summary"
            static let attributes = "attributes"
            
        }
    }
    
    struct Notifications {
        static let didChangeCategoryNotification = "didChangeCategoryNotification"
    }
    
    
}
