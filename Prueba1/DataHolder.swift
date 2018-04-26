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
import FirebaseStorage

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var firestoreDB:Firestore?
    var firStorage:Storage?
    var myUser:User = User()
    var arRepos:[Repo] = []
    
    func initFireBase() {
        FirebaseApp.configure()
        firestoreDB = Firestore.firestore()
        firStorage = Storage.storage()
    }
    
    func downloadRepos(delegate:DataHolderDelegate) {
        var blEnd:Bool = false
        DataHolder.sharedInstance.firestoreDB?.collection("Repos").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                blEnd = false
                delegate.DHDdownloadReposComplete!(blEnd: false)
            } else {
                for document in querySnapshot!.documents {
                    let repo:Repo = Repo()
                    repo.sID = document.documentID
                    repo.setMap(valores: document.data())
                    self.arRepos.append(repo)
                    print("\(document.documentID) => \(document.data())")
                }
                print("Nº repos: ",self.arRepos.count)
                blEnd = true
                delegate.DHDdownloadReposComplete!(blEnd: true)
            }
        }
    }
    
}

@objc protocol DataHolderDelegate {
    @objc optional func DHDdownloadReposComplete(blEnd:Bool)
}
