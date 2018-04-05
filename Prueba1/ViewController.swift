//
//  ViewController.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 3/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnLogin:UIButton?
    //Forma de declarar variables que se asignarán a elementos gráficos
    var myUser:String = "Sara"
    var myPass:String = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtUser?.text = myUser
        txtPass?.text = myPass
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(){
        if txtUser?.text == myUser && txtPass?.text == myPass{
            print("Logging as "+(txtUser?.text)!)
            self.performSegue(withIdentifier: "trLogin", sender: self)
            //Código de transición de una pantalla a otra
        } else {
            print("The Password isn't correct")
        }
    }
    
}

