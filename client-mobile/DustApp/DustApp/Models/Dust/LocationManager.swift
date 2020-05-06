//
//  LocationManager.swift
//  DustApp
//
//  Created by Cory Kim on 2020/03/31.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import CoreLocation

class LocationManager: CLLocationManager {
    
    override init() {
        super.init()
        configure()
    }
    
    private func configure() {
        requestAlwaysAuthorization()
    }
}
