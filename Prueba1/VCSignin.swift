//
//  VCSignin.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 3/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class VCSignin: UIViewController {

    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtRepeatPass:UITextField?
    @IBOutlet var btnSingin:UIButton?
    @IBOutlet var btnCancel:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signin(){
        if txtPass?.text ==  txtRepeatPass?.text{
            print("Logging as "+(txtUser?.text)!)
            self.performSegue(withIdentifier: "trSignin", sender: self)
        } else {
            print("The Passwords don't match")
        }
    }
    
    @IBAction func cancel(){
            self.performSegue(withIdentifier: "trCancel", sender: self)
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
