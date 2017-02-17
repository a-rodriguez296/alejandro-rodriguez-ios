//
//  RappiApiClient.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


typealias TopApplicationsClosure = ( _: Bool, _:String?) -> Void

protocol RappiClientProtocolDelegate:class {
    func didDownloadData(success:Bool, error:String?)
}



class RappiApiClient{
    
    static let sharedInstance = RappiApiClient()
    
    weak var delegate:RappiClientProtocolDelegate?
}

extension RappiApiClient{
    
    
    func getTopApplications(completion:@escaping TopApplicationsClosure){
        
        Alamofire.request(RappiRouter.topApplications).responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let applicationsResponse = ApplicationsResponse(json: json)
                CoreDataOperations.saveCategoriesAndApplications(with: applicationsResponse)
                completion(true, nil)
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
}

