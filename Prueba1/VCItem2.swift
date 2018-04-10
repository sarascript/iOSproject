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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell2:MyCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell2", for: indexPath) as! MyCell2
        
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
