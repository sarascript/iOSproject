//
//  DataHolder.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 10/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import Firebase

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var sEmail:String = "Sara@gmail.com"
    
    func initFireBase() {
        FirebaseApp.configure()
        //var db = Firestore.firestore()
    }
    
}
