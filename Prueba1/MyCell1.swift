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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
