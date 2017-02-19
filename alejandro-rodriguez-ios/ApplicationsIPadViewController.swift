//
//  ApplicationsIPadViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/19/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class ApplicationsIPadViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
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
        
        viewModel.initializeFetchedResultsController()
        title = viewModel.category.name!
        
        collectionView.register(UINib(nibName: "ApplicationsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ApplicationsIPadViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let application = viewModel.object(at: indexPath) as! CDApplication
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ApplicationsCollectionViewCell
        cell.initializeCell(with: application)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let application = viewModel.object(at: indexPath) as! CDApplication
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        self.navigationController?.view.layer.add(transition, forKey: nil)
        
        
        navigationController?.pushViewController(ApplicationDetailViewController(application: application), animated: true)
    }
}

extension ApplicationsIPadViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 198, height: 198)
    }
}

extension ApplicationsIPadViewController{
    
    func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeCategory(notification:)), name: Notification.Name(Constants.Notifications.didChangeCategoryNotification), object: nil)
    }
    
    func didChangeCategory(notification: Notification){
        
        viewModel = ApplicationsViewModel(category: (notification.object as? CDCategory)!)
        viewModel.initializeFetchedResultsController()
        collectionView.reloadData()
        title = viewModel.category.name!
    }
    
}

