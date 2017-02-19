//
//  LoadingViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import SwiftMessages

class LoadingViewController: UIViewController {
    
    
    let viewModel = LoadingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.delegate = self
        
        
        //Fetch data from the view model
        viewModel.fetchData()
    }
    
    fileprivate func configureAlertControllerWith(message:String) -> UIAlertController{
        
        let alertController = UIAlertController(title: NSLocalizedString("Atención", comment: ""), message:message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default)
        alertController.addAction(cancelAction)
        
        return alertController
        
    }
    
    fileprivate func createOfflineAlert() -> MessageView{
        
        let view = MessageView.viewFromNib(layout: .StatusLine)
        
        view.configureTheme(.warning)
        view.configureDropShadow()
        view.configureContent(title: NSLocalizedString("Atención", comment: ""), body: NSLocalizedString("No tienes conexión a Internet", comment: ""))
        
        return view
    }
    
}

extension LoadingViewController: LoadingViewModelProtocol{
    
    func didDownloadData( success: Bool, error: String?) {
        if success{
            
            
            let when = DispatchTime.now() + 1.5
            DispatchQueue.main.asyncAfter(deadline: when) {
                let rootVC = UINavigationController(rootViewController: CategoriesViewController())
                self.present(rootVC, animated: true, completion: nil)
            }
           
            
        }
        else{
            
            //This is a Swift bug.
            DispatchQueue.main.async {
                self.present(self.configureAlertControllerWith(message: error!), animated: true)
            }
            
        }
    }
    
    func noInternetConnection(){
        
        SwiftMessages.show(view: createOfflineAlert())
    }
}
