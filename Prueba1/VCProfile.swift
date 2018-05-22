//
//  VCProfile.swift
//  Prueba1
//
//  Created by Sara Correas on 22/5/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class VCProfile: UIViewController {
    
    @IBOutlet var myUsername:UILabel?
    @IBOutlet var myAvatar:UIImageView?
    @IBOutlet var myName:UILabel?
    @IBOutlet var myEmail:UILabel?
    @IBOutlet var myBio:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        myUsername?.text = DataHolder.sharedInstance.myUser.sUsername
        //myAvatar?.image = DataHolder.sharedInstance.myUser.sAvatar
        myName?.text = DataHolder.sharedInstance.myUser.sName
        myEmail?.text = DataHolder.sharedInstance.myUser.sEmail
        myBio?.text = DataHolder.sharedInstance.myUser.sBio
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changeAvatar(){
        self.performSegue(withIdentifier: "trChangeAvatar", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
