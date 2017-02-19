//
//  ApplicationDetailViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Created by Alejandro Rodriguez on 2/17/17..
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class ApplicationDetailViewController: UIViewController {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var txtAppName: UILabel!
    @IBOutlet weak var txtAppCategory: UILabel!
    @IBOutlet weak var txtFieldAppSummary: UITextView!
    
    var application:CDApplication
    
    
    init(application: CDApplication) {
        self.application = application
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        
        imgIcon.clipsToBounds = true
        imgIcon.layoutIfNeeded()
        
        setupViews()
        
        setupNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        txtFieldAppSummary.flashScrollIndicators()
        txtFieldAppSummary.setContentOffset(CGPoint.zero, animated: true)
        
        
    }
    
    
    func setupViews(){
        imgIcon.image = application.photo?.image()
        txtAppName.text = application.name!
        txtAppCategory.text = application.category?.name!
        txtFieldAppSummary.text = application.summary!
        
        title = application.name!
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ApplicationDetailViewController{
    
    func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeCategory(notification:)), name: Notification.Name(Constants.Notifications.didChangeCategoryNotification), object: nil)
    }
    
    func didChangeCategory(notification: Notification){
        
        _ = navigationController?.popViewController(animated: true)
    }
}




