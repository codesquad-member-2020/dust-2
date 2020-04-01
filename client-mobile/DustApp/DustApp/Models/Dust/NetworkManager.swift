//
//  NetworkManager.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/01.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

protocol NetworkManagable {
    func requestData(with item: Any?, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkManager: NetworkManagable {
    
    static let shared = NetworkManager()
    
    let dustInfoURL = "http://ec2-15-165-109-219.ap-northeast-2.compute.amazonaws.com:8080"
    let stationPath: String = "location"
    let latitudeQueryParameter: String = "latitude"
    let longtitudeQueryParameter: String = "longtitude"
    
    func requestData(with item: Any?, completion: @escaping (Data?, Error?) -> Void) {
        guard let location = item as? Location else { return }
        let stationURL = URL(string: "\(dustInfoURL)/\(stationPath)?\(latitudeQueryParameter)=\(location.latitude)&\(longtitudeQueryParameter)=\(location.longitude)")!
        let request = URLRequest(url: stationURL)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error { completion(nil, error) }
            completion(data, nil)
        }
    }
}
