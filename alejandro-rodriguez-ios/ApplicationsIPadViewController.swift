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
    
    
    let viewModel: ApplicationsViewModel
    
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
        
        
        collectionView.register(UINib(nibName: "ApplicationsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
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
        print(application.name!)
    }
}

extension ApplicationsIPadViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 198, height: 198)
    }
    
}
