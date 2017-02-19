//
//  CustomSplitViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/19/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class CustomSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        
        if secondaryViewController is UINavigationController && (secondaryViewController as! UINavigationController).topViewController is ApplicationsIphoneViewController {
            return true
        }
        else{
            return false
        }
    }
}
