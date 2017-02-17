//
//  Protocols.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation



protocol LoadingViewModelProtocol:class {
    
    func didDownloadData(success:Bool, error:String?)
}
