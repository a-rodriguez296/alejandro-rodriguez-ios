//
//  LoadingViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        RappiApiClient.sharedInstance.getTopApplications { (success, response) in
            
        }
        
    }
}
