//
//  VCMap.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 19/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMap: UIViewController, LocationAdminDelegate, MKMapViewDelegate, DataHolderDelegate {
    
    @IBOutlet var myMap:MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.locationAdmin?.delegate = self
        myMap?.showsUserLocation = true
        
        DataHolder.sharedInstance.downloadPines(map: myMap!, delegate: self)
            //var blEnd:Bool = false
            //DataHolder.sharedInstance.firestoreDB?.collection("Users").getDocuments() { (querySnapshot, err) in
              //  if let err = err {
                //    print("Error getting documents: \(err)")
                  //  blEnd = false
               // } else {
                 //   for document in querySnapshot!.documents {
                   //     let user:User = User()
                     //   user.sID = document.documentID
                       // user.setMap(valores: document.data())
                       // self.arUsers.append(user)
                       // print("\(document.documentID) => \(document.data())")
                       // self.addPin(myTitle: user.sUsername!, latitude: user.dbLatitude!, longitude: user.dbLongitude!)
                   // }
                   // blEnd = true
               // }
           // }
        
        //self.addPin(myTitle: DataHolder.sharedInstance.myUser.sUsername!, coor.latitude: 40.540290, coor.longitude: -3.893893)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationUpdated(coor: CLLocationCoordinate2D) {
        centerOnLocation(coor: coor)
        //self.addPin(myTitle: DataHolder.sharedInstance.myUser.sUsername!, latitude: coor.latitude, longitude: coor.longitude)
    }
    
    func centerOnLocation (coor: CLLocationCoordinate2D) {
        let myRegion:MKCoordinateRegion = MKCoordinateRegion(center: coor, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        myMap?.setRegion(myRegion, animated: true)
    }
    
    //func addPin(myTitle:String, latitude lat:Double, longitude lon:Double) {
      //  var myAnnotation:MKPointAnnotation = MKPointAnnotation()
        
       // if pines![myTitle] == nil {
            
       // } else {
         //   myAnnotation = pines?[myTitle] as! MKPointAnnotation
           // myMap?.removeAnnotation(myAnnotation)
       // }
        
       // myAnnotation.coordinate.latitude = lat
       // myAnnotation.coordinate.longitude = lon
       // myAnnotation.title = myTitle
       // pines?[myTitle] = myAnnotation
       // myMap?.addAnnotation(myAnnotation)
    //}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
