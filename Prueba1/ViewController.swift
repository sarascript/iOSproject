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

class ViewController: UIViewController {

    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnLogin:UIButton?
    //Forma de declarar variables que se asignarán a elementos gráficos
    var myEmail:String = "User"
    var myPass:String = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtEmail?.text = DataHolder.sharedInstance.sEmail
        txtPass?.text = myPass
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(){
        Auth.auth().signIn(withEmail: (txtEmail?.text)!, password: (txtPass?.text)!) { (user, error) in
            if (user != nil) {
                print("Te registraste con user ID: " + (user?.uid)!)
                let refUser = DataHolder.sharedInstance.firestoreDB?.collection("Users").document((user?.uid)!)
                refUser?.getDocument { (document, error) in
                    if document != nil {
                        print(document?.data()!)
                        self.performSegue(withIdentifier: "trLogin", sender: self)
                    } else {
                        print(error!)
                    }
                }
            } else {
                print (error!)
            }
        }
        
    }
    
}

