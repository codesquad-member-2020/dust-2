//
//  LocationManagerDelegate.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/31.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    
    var didUpdateLocation: ((Location?, Error?) -> Void)?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let coordinate = location.coordinate
        let ladtitude = coordinate.latitude as Double
        let longitude = coordinate.longitude as Double
        let currentLocation = Location(latitude: ladtitude, longitude: longitude)
        didUpdateLocation?(currentLocation, nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        didUpdateLocation?(nil, error)
    }
}
