//
//  ApplicationsCollectionViewCell.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/19/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class ApplicationsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgAppThumbnail: UIImageView!
    @IBOutlet weak var lblAppName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        imgAppThumbnail.clipsToBounds = true
        imgAppThumbnail.layoutIfNeeded()
    }
    
    
    func initializeCell(with application: CDApplication){
        
        lblAppName.text = application.name!
        
        //If thumbnail is available, use it. Otherwise, donwload it
        if let thumbnail = application.photo?.image(){
            imgAppThumbnail.image = thumbnail
        }
        else{
            imgAppThumbnail.af_setImage(withURL: URL(string: application.thumbnailURL!)!,
                                        placeholderImage: nil,
                                        filter: nil,
                                        progress: nil,
                                        progressQueue: DispatchQueue.main,
                                        imageTransition: .flipFromLeft(1),
                                        runImageTransitionIfCached: false,
                                        completion: { (response) in
                                            
                                            switch response.result{
                                            case .success(let image):
                                                application.assignPhoto(image: image)
                                            case .failure:
                                                break
                                            }
                                            
            })
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgAppThumbnail.af_cancelImageRequest()
        imgAppThumbnail.image = nil
    }


}
