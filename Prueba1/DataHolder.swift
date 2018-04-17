//
//  DataHolder.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 10/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var firestoreDB:Firestore?
    var myUser:User = User()
    
    func initFireBase() {
        FirebaseApp.configure()
        firestoreDB = Firestore.firestore()
    }
    
}
