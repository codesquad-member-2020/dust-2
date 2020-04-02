//
//  MockupDustNetworkManager.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/03.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class MockupDustNetworkManager: NetworkManagable {
    
    static let shared = MockupDustNetworkManager()
    
    let mockupJSON = """
    {
      "location": "강남구",
      "dusts": [
        {
          "dataTime": "2020-03-30 24:00",
          "pm10Value": 35,
          "pm10Grade": 2
        },
        {
          "dataTime": "2020-03-30 23:00",
          "pm10Value": 44,
          "pm10Grade": 2
        },
        {
          "dataTime": "2020-03-30 22:00",
          "pm10Value": 48,
          "pm10Grade": 2
        },
        {
          "dataTime": "2020-03-30 21:00",
          "pm10Value": 42,
          "pm10Grade": 2
        },
        {
          "dataTime": "2020-03-30 20:00",
          "pm10Value": 89,
          "pm10Grade": 3
        },
        {
          "dataTime": "2020-03-30 19:00",
          "pm10Value": 167,
          "pm10Grade": 4
        },
        {
          "dataTime": "2020-03-30 18:00",
          "pm10Value": 202,
          "pm10Grade": 4
        }
      ]
    }
    """
    
    func requestData(with item: Any?, completion: @escaping (Data?, Error?) -> Void) {
        let data = mockupJSON.data(using: .utf8)
        completion(data, nil)
    }
    
    func requestStationData(with item: Any?, completion: @escaping (Station?, Error?) -> Void) {
        requestData(with: item) { (data, error) in
            if let error = error {
                completion(nil, error)
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            guard let station = try? decoder.decode(Station.self, from: data) else { return }
            completion(station, nil)
        }
    }
}
