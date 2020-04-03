//
//  ForecastImages.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/03.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    
    var forecastSummary: String
    var allGradesSummary: String
    var images: [String]
    
    enum CodingKeys: String, CodingKey {
        case forecastSummary = "informOverall"
        case allGradesSummary = "informGrade"
        case images = "images"
    }
}
