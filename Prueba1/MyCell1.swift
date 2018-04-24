//
//  MyCell1.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 5/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class MyCell1: UITableViewCell {
    
    @IBOutlet var myLabel:UILabel?
    @IBOutlet var myImg:UIImageView?
    @IBOutlet var myAuthor:UILabel?
    @IBOutlet var myWatch:UILabel?
    @IBOutlet var myWatchImg:UIImageView?
    @IBOutlet var myStar:UILabel?
    @IBOutlet var myStarImg:UIImageView?
    @IBOutlet var myFork:UILabel?
    @IBOutlet var myForkImg:UIImageView?
    var downloadedImage:UIImage?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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

