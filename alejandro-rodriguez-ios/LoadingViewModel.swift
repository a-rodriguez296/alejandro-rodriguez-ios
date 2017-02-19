//
//  LoadingViewModel.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import ReachabilitySwift



class LoadingViewModel {
    
    weak var delegate:LoadingViewModelProtocol?
    
    
    func fetchData(){
        
        
        //Network status
        let reachabilityObject = Reachability()!
        let networkStatus = reachabilityObject.currentReachabilityStatus
        
        
        //Data status
        let dataStatus = CoreDataOperations.isDataAvailable()
        
        //Initial Cases
        
        
        // No data and no internet
        if dataStatus == false && networkStatus == .notReachable{
            
            //Display alert
            delegate?.didDownloadData(success: false, error: NSLocalizedString("Debes tener Internet la primera vez que usas la aplicación", comment: ""))
            self.delegate?.noInternetConnection()
        }
            
            
            
        //No data and there is an internet connection
        else if dataStatus == false && networkStatus != .notReachable{
            
            //Donwload data
            
            fetchDataFromNetwork()
        }
            
            
            
            
        //nth Cases
            
        //There is already donwloaded data but there's no internet
        else if dataStatus == true && networkStatus == .notReachable{
            
            //Do nothing. Use downloaded data
            
            self.delegate?.didDownloadData(success: true, error: nil)
            self.delegate?.noInternetConnection()
        }
        
            
            
        //There is already downloaded data and there's an internet connection
        else{
            
            //Delete current data. Since there is a cascade rule, if we delete the categories, the applications and the photos are also deleted.
            CDCategory.mr_truncateAll()
    
            //Fetch data form the internet
            fetchDataFromNetwork()
        }
        
    }
    
    fileprivate func fetchDataFromNetwork(){
        
        RappiApiClient.sharedInstance.getTopApplications(completion: {[unowned self] (success, error) in
            
            if success{
                self.delegate?.didDownloadData(success: true, error: nil)
            }
            else{
                self.delegate?.didDownloadData(success: false, error:  NSLocalizedString("Ocurrió un error. Intenta de nuevo más tarde", comment: ""))
            }
        })
    }
    
    
}
