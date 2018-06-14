//
//  VCSignin.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 3/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class VCSignin: UIViewController, DataHolderDelegate, UITextFieldDelegate {

    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtRepeatPass:UITextField?
    @IBOutlet var btnSingin:UIButton?
    @IBOutlet var btnCancel:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtEmail?.delegate = self
        self.txtPass?.delegate = self
        self.txtRepeatPass?.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func DHDregisterComplete(blEnd:Bool) {
        if blEnd {
            self.performSegue(withIdentifier: "trSignin", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signin(){
        DataHolder.sharedInstance.signin(email: (txtEmail?.text)!, pass: (txtPass?.text)!, repass: (txtRepeatPass?.text)!, delegate: self)
        // DataHolder.sharedInstance.myUser.sEmail = txtEmail?.text
        // if txtPass?.text ==  txtRepeatPass?.text{
        // Auth.auth().createUser(withEmail: (txtEmail?.text)!, password: (txtPass?.text)!) { (user, error) in
        // if (user != nil) {
        // print("Te registraste con user ID: " + (user?.uid)!)
        // Add a new document with a generated ID
        // DataHolder.sharedInstance.firestoreDB?.collection("Users").document((user?.uid)!).setData(DataHolder.sharedInstance.myUser.getMap()) { err in
        // if let err = err {
        //  print("Error adding document: \(err)")
        //} else {
        //    print("Document added with ID: ")
        //  }
        //}
        //  self.performSegue(withIdentifier: "trSignin", sender: self)
        //} else {
        //      print (error!)
        //    }
        //  }
        //}
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
