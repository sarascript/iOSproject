//
//  LocationAdmin.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 7/5/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import CoreLocation

class LocationAdmin: NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager?
    var delegate: LocationAdminDelegate?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("my latitude: ", locations[0].coordinate.latitude, ", my longitude: ", locations[0].coordinate.longitude)
        delegate?.locationUpdated(coor: locations[0].coordinate)
    }
    
}

protocol LocationAdminDelegate {
    func locationUpdated(coor:CLLocationCoordinate2D)
}
