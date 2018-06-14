//
//  ViewController.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 3/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController, DataHolderDelegate, UITextFieldDelegate {

    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnLogin:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtEmail?.delegate = self
        self.txtPass?.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func DHDloginComplete(blEnd:Bool) {
        if blEnd {
            self.performSegue(withIdentifier: "trLogin", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(){
        DataHolder.sharedInstance.login(email: (txtEmail?.text)!, pass: (txtPass?.text)!, delegate: self)
        //Auth.auth().signIn(withEmail: (txtEmail?.text)!, password: (txtPass?.text)!) { (user, error) in
        //  if (user != nil) {
        //    print("Te registraste con user ID: " + (user?.uid)!)
        //  let refUser = DataHolder.sharedInstance.firestoreDB?.collection("Users").document((user?.uid)!)
        //refUser?.getDocument { (document, error) in
        //  if document != nil {
        //    DataHolder.sharedInstance.myUser.setMap(valores: (document?.data())!)
        //  print("Username: ",DataHolder.sharedInstance.myUser.sUsername)
        //self.performSegue(withIdentifier: "trLogin", sender: self)
        //} else {
        //  print(error!)
        //}
        //}
        //} else {
        //   print (error!)
        //}
        //}
        
    }
    
}
