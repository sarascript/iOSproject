//
//  VCItem2.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 5/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class VCItem2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var myCollectionView:UICollectionView?
    var arRepos:[Repo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.firestoreDB?.collection("Repos").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let repo:Repo = Repo()
                    repo.sID = document.documentID
                    repo.setMap(valores: document.data())
                    self.arRepos.append(repo)
                    print("\(document.documentID) => \(document.data())")
                }
                print("Nº repos: ",self.arRepos.count)
                self.myCollectionView?.reloadData()
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arRepos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("***",self.arRepos[indexPath.row].sAuthor)
        let myCell2:MyCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell2", for: indexPath) as! MyCell2
        myCell2.myLabel?.text = self.arRepos[indexPath.row].sName
        myCell2.showImage(uri: self.arRepos[indexPath.row].sImage!)
        
        /*
        if indexPath.row == 0 {
            myCell2.myLabel?.text = "Imagen 1"
            myCell2.myImg?.image=UIImage(named: "logo.png")
        } else if indexPath.row == 1 {
            myCell2.myLabel?.text = "Imagen 2"
            myCell2.myImg?.image=UIImage(named: "cat1.jpg")
        } else if indexPath.row == 2 {
            myCell2.myLabel?.text = "Imagen 3"
            myCell2.myImg?.image=UIImage(named: "logo.png")
        } else if indexPath.row == 3 {
            myCell2.myLabel?.text = "Imagen 4"
            myCell2.myImg?.image=UIImage(named: "logo.png")
        } else if indexPath.row == 4 {
            myCell2.myLabel?.text = "Imagen 5"
            myCell2.myImg?.image=UIImage(named: "cat1.jpg")
        }
 */
        
        return myCell2
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
