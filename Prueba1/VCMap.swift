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

class VCMap: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var myMap:MKMapView?
    var locationManager:CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        myMap?.showsUserLocation = true
        self.addPin(myTitle: DataHolder.sharedInstance.myUser.sUsername!, latitude: 40.540290, longitude: -3.893893)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location: ",locations[0])
        let mySpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let tempregion:MKCoordinateRegion = MKCoordinateRegion(center: locations[0].coordinate, span: mySpan)
        myMap?.setRegion(tempregion, animated: true)
    }
    
    func addPin(myTitle:String, latitude lat:Double, longitude lon:Double) {
        let myAnnotation:MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate.latitude = lat
        myAnnotation.coordinate.longitude = lon
        myAnnotation.title = myTitle
        myMap?.addAnnotation(myAnnotation)
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
