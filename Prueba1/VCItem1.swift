//
//  VCItem1.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 5/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class VCItem1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Implementar más interfaces
    
    @IBOutlet var myTableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Cuando carga la parte visual, el sistema consulta cuántas celdas se van a pintar. La propia tabla llama a este método
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Entrará en este método el número de celdas pintadas (método anterior)
        
        let myCell1 = tableView.dequeueReusableCell(withIdentifier: "myCell1") as! MyCell1
        
        if indexPath.row == 0 {
            myCell1.myLabel?.text = "Imagen 1"
        } else if indexPath.row == 1 {
            myCell1.myLabel?.text = "Imagen 2"
        } else if indexPath.row == 2 {
            myCell1.myLabel?.text = "Imagen 3"
        } else if indexPath.row == 3 {
            myCell1.myLabel?.text = "Imagen 4"
        } else if indexPath.row == 4 {
            myCell1.myLabel?.text = "Imagen 5"
        }
        
        return myCell1
    
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
