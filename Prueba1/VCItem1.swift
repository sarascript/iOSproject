//
//  VCItem1.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 5/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class VCItem1: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
    //Implementar más interfaces
    
    @IBOutlet var myTableView:UITableView?
    var arRepos:[Repo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.downloadRepos(delegate: self)
        // Do any additional setup after loading the view.
    }
    
    func DHDdownloadReposComplete(blEnd:Bool) {
        if blEnd {
            self.refreshUI()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Cuando carga la parte visual, el sistema consulta cuántas celdas se van a pintar. La propia tabla llama a este método
        return DataHolder.sharedInstance.arRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Entrará en este método el número de celdas pintadas (método anterior)
        print("***",DataHolder.sharedInstance.arRepos[indexPath.row].sAuthor)
        let myCell1 = tableView.dequeueReusableCell(withIdentifier: "myCell1") as! MyCell1
        myCell1.myLabel?.text = DataHolder.sharedInstance.arRepos[indexPath.row].sName
        myCell1.showImage(uri: DataHolder.sharedInstance.arRepos[indexPath.row].sImage!)
        myCell1.myAuthor?.text = DataHolder.sharedInstance.arRepos[indexPath.row].sAuthor!
        myCell1.myWatch?.text = String(describing: DataHolder.sharedInstance.arRepos[indexPath.row].iWatch!)
        myCell1.myStar?.text = String(describing: DataHolder.sharedInstance.arRepos[indexPath.row].iStar!)
        myCell1.myFork?.text = String(describing: DataHolder.sharedInstance.arRepos[indexPath.row].iFork!)
        
        /*
        if indexPath.row == 0 {
            myCell1.myLabel?.text = "Imagen 1"
            myCell1.myImg?.image=UIImage(named: "cat1.jpg")
        } else if indexPath.row == 1 {
            myCell1.myLabel?.text = "Imagen 2"
            myCell1.myImg?.image=UIImage(named: "logo.png")
        } else if indexPath.row == 2 {
            myCell1.myLabel?.text = "Imagen 3"
            myCell1.myImg?.image=UIImage(named: "cat1.jpg")
        } else if indexPath.row == 3 {
            myCell1.myLabel?.text = "Imagen 4"
            myCell1.myImg?.image=UIImage(named: "logo.png")
        } else if indexPath.row == 4 {
            myCell1.myLabel?.text = "Imagen 5"
            myCell1.myImg?.image=UIImage(named: "cat1.jpg")
        }
 */
        
        return myCell1
    
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.myTableView?.reloadData()
        })
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
