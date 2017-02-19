//
//  ApplicationsIphoneViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class ApplicationsIphoneViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var viewModel: ApplicationsViewModel
    
    init(category: CDCategory) {
        viewModel = ApplicationsViewModel(category: category)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib.init(nibName: "ApplicationTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        title = viewModel.category.name!
        
        viewModel.initializeFetchedResultsController()
        
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension ApplicationsIphoneViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let application = viewModel.object(at: indexPath) as! CDApplication
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ApplicationTableViewCell
        cell.initializeCell(with: application)
        return cell
    }
}

extension ApplicationsIphoneViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let application = viewModel.object(at: indexPath) as! CDApplication
        
        navigationController?.pushViewController(ApplicationDetailViewController(application: application), animated: true)
    }
}

extension ApplicationsIphoneViewController{
    
    func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeCategory(notification:)), name: Notification.Name(Constants.Notifications.didChangeCategoryNotification), object: nil)
    }
    
    func didChangeCategory(notification: Notification){
        
        viewModel = ApplicationsViewModel(category: (notification.object as? CDCategory)!)
        viewModel.initializeFetchedResultsController()
        tableView.reloadData()
        title = viewModel.category.name!
    }
    
}

