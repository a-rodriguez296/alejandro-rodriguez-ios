//
//  AppDelegate.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Initialize Core Data
       initializeCoreData()
        
        //Crate window
        window = UIWindow(frame: UIScreen.main.bounds)
        let loadingVC = LoadingViewController()
        
        //Assing vc to root
        window?.rootViewController = loadingVC
        
        window?.backgroundColor = .white
        
        //show it
        window?.makeKeyAndVisible()
        
        
        return true
    }
    
    func initializeCoreData(){
        MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: "Model")
        autoSave()
    }

    
    func autoSave(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStore { (success, error) in
            if let e = error{
                print(e.localizedDescription)
            }
        }
        
        //Block to "auto call" this function every 3 seconds
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.autoSave()
        }
    }
}

