//
//  LoadingViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    
    let viewModel = LoadingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.delegate = self
        
        
        //Fetch data from the view model
        viewModel.fetchData()
    }
    
    func configureAlertControllerWith(message:String) -> UIAlertController{
        
        let alertController = UIAlertController(title: NSLocalizedString("Atención", comment: ""), message:message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default)
        alertController.addAction(cancelAction)
        
        return alertController
        
    }
    
}

extension LoadingViewController: LoadingViewModelProtocol{
    
    func didDownloadData( success: Bool, error: String?) {
        if success{
        }
        else{
            
            //This is a Swift bug. 
            DispatchQueue.main.async {
               self.present(self.configureAlertControllerWith(message: error!), animated: true)
            }
            
        }
        
        
    }
}
