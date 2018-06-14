//
//  VCProfile2.swift
//  Prueba1
//
//  Created by Sara Correas on 14/6/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class VCProfile2: UIViewController {
    
    @IBOutlet var myUsername:UILabel?
    @IBOutlet var myTitle:UILabel?
    @IBOutlet var myAvatar:UIImageView?
    @IBOutlet var myXP:UILabel?
    @IBOutlet var myRepos:UILabel?
    @IBOutlet var myFollowers:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myUsername?.text = DataHolder.sharedInstance.myUser.sUsername
        self.showImage(uri: DataHolder.sharedInstance.myUser.sAvatar!)
        myTitle?.text = DataHolder.sharedInstance.myUser.sTitle
        myXP?.text = "\(DataHolder.sharedInstance.myUser.iXP ?? 0)"
        myRepos?.text = "\(DataHolder.sharedInstance.myUser.nRepos ?? 0)"
        myFollowers?.text = "\(DataHolder.sharedInstance.myUser.nFollowers ?? 0)"
        // Do any additional setup after loading the view.
        print("DATOOOOOOOOS ",DataHolder.sharedInstance.myUser.iXP!, DataHolder.sharedInstance.myUser.nRepos!, DataHolder.sharedInstance.myUser.nFollowers!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultProfile(){
        self.performSegue(withIdentifier: "trDefaultP", sender: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    var downloadedImage:UIImage?
    
    func showImage(uri:String) {
        // Create a reference to the file you want to download
        self.myAvatar?.image = nil
        //if downloadedImage == nil {
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                self.downloadedImage = UIImage(data: data!)
                self.myAvatar?.image = self.downloadedImage
            }
        }
    }
    
}
