//
//  CategoriesViewController.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import MagicalRecord

class CategoriesViewController: UIViewController {
    
    let viewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = NSLocalizedString("Categorías", comment: "")
        viewModel.initializeFetchedResultsController()
    }
    
}

extension CategoriesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let category = viewModel.object(at: indexPath) as! CDCategory
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell!.selectionStyle = .none
        cell!.textLabel?.text = category.name!
        
        return cell!
    }
}

extension CategoriesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let category = viewModel.object(at: indexPath) as! CDCategory
        print(category.name!)
        
    }
}
