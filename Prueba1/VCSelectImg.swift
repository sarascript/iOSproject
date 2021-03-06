//
//  VCSelectImg.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 9/5/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class VCSelectImg: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imgView:UIImageView?
    let imagePicker = UIImagePickerController()
    var imgData:Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func galleryBtn() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func uploadBtn() {
        let imagenRef = DataHolder.sharedInstance.firStorageRef?.child("users/avatar.jpg")
        let uploadTask = imagenRef?.putData(imgData!, metadata:nil) { (metadata, error)
            in
            guard let metadata = metadata else {
                return
            }
            let downloadURL = metadata.downloadURL
            DataHolder.sharedInstance.myUser.sImage = "gs://charagit-e5789.appspot.com/users/avatar.jpg"
            self.performSegue(withIdentifier: "trCancelChange", sender: self)
            print("URL: ", downloadURL)
        }
    }
    
    @IBAction func cameraBtn() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        imgData = UIImageJPEGRepresentation(img!, 0.5)! as Data
        imgView?.image = img
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(){
        self.performSegue(withIdentifier: "trCancelChange", sender: self)
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
