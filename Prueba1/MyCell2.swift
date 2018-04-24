//
//  MyCell2.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 5/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class MyCell2: UICollectionViewCell {
    
    @IBOutlet var myLabel:UILabel?
    @IBOutlet var myImg:UIImageView?
    var downloadedImage:UIImage?
    
    func showImage(uri:String) {
        // Create a reference to the file you want to download
        self.myImg?.image = nil
        //if downloadedImage == nil {
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                self.downloadedImage = UIImage(data: data!)
                self.myImg?.image = self.downloadedImage
            }
        }
    }
    
}
