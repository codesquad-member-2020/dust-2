//
//  ForecastNetworkManager.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class ForecastNetworkManager: NetworkManagable {
    
    static let shared = ForecastNetworkManager()
    
    let hostURL: String = "http://ec2-15-165-109-219.ap-northeast-2.compute.amazonaws.com"
    let port: String = "8080"
    let stationPath: String = "/api/forecast"
    
    func requestData(with item: Any?, completion: @escaping (Data?, Error?) -> Void) {
        guard let imageURLString = item as? String else { return }
        let imageURL = URL(string: imageURLString)!
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            if let error = error { completion(nil, error) }
            if let data = data { completion(data, nil) }
        }.resume()
    }
    
    func requestForecastData(completion: @escaping ((Forecast?, Error?) -> Void)) {
        let forecastImagesURL = URL(string: "\(hostURL):\(port)\(stationPath)")!
        URLSession.shared.dataTask(with: forecastImagesURL) { (data, _, error) in
            if let error = error { completion(nil, error) }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            guard let forecast = try? decoder.decode(Forecast.self, from: data) else { return }
            completion(forecast, nil)
        }.resume()
    }
}
